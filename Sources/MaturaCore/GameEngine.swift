import Foundation

/// Symulacja trybu CLASSIC.
///
/// Wszystko dzieje się w kwadracie jednostkowym: działko stoi w (0.5, 0.5),
/// potworki wchodzą z lewej i prawej krawędzi i idą w jego stronę. Warstwa
/// rysująca przelicza te współrzędne na piksele, dzięki czemu ta klasa nie zna
/// SwiftUI ani UIKit-u i daje się testować zwykłym XCTest-em: także na Linuksie,
/// bez symulatora.
public final class GameEngine {

    // MARK: - Stałe

    public static let cannonX: Double = 0.5
    public static let cannonY: Double = 0.5
    public static let cannonRadius: Double = 0.06

    // Tempo dobrane pomiarem, nie na oko: przy średniej odpowiedzi ośmiu liter
    // gracz piszący 2,3 litery na sekundę potrzebuje około 5,5 s na potworka.
    // Wcześniejsze 3,4 s odstępu między falami było krótsze niż to, więc gra
    // wyprzedzała nawet szybko piszących już na pierwszym poziomie.
    static let baseSpeed: Double = 0.024
    static let speedPerLevel: Double = 0.0030
    static let projectileSpeed: Double = 1.25
    static let baseSpawnInterval: Double = 6.5
    static let minSpawnInterval: Double = 2.6
    static let spawnStepPerLevel: Double = 0.14
    static let killsPerLevel: Int = 6
    static let crateInterval: Double = 19
    static let crateTTL: Double = 13
    public static let crateAmount: Int = 3

    public static let maxMonsters: Int = 7
    public static let deathFrameTime: Double = 0.35
    public static let levelBannerTime: Double = 1.6
    /// Cykl chodu: pakiet grafiki prosi o klatkę bazową i `_f2` na zmianę co ~200 ms.
    public static let walkFrameTime: Double = 0.2

    // MARK: - Stan

    private let set: WordSet
    private let config: GameConfig
    private var rng: SeededRandom

    private var nextId: Int = 1
    public private(set) var monsters: [Monster] = []
    public private(set) var crates: [Crate] = []
    public private(set) var projectiles: [Projectile] = []
    public private(set) var corpses: [Corpse] = []

    private var spawnTimer: Double = 0.9
    private var crateTimer: Double = GameEngine.crateInterval
    public private(set) var flash: FlashKind?
    private var flashTTL: Double = 0
    public private(set) var levelUpBanner: Double = 0
    private var lastLevel: Int = 1

    public private(set) var typed: String = ""
    /// Pozycja karetki w `typed`: dokument projektowy przewiduje strzałki.
    public private(set) var cursor: Int = 0

    public private(set) var lives: Int
    public private(set) var heavyAmmo: Int = 0
    public private(set) var score: Int = 0
    public private(set) var kills: Int = 0
    public private(set) var streak: Int = 0
    public private(set) var bestStreak: Int = 0
    public private(set) var gameOver: Bool = false
    public private(set) var elapsed: Double = 0

    public var maxLives: Int { config.lives }
    public var level: Int { 1 + kills / GameEngine.killsPerLevel }

    /// Premia za serię: x2 od trzech z rzędu, potem x3, x4 i x5.
    public var multiplier: Int {
        switch streak {
        case 12...: return 5
        case 9...: return 4
        case 6...: return 3
        case 3...: return 2
        default: return 1
        }
    }

    private let playable: [(prompt: String, answers: [String])]
    public var isPlayable: Bool { !playable.isEmpty }

    public init(set: WordSet, config: GameConfig = GameConfig(), seed: UInt64 = 0x2545F4914F6CDD1D) {
        self.set = set
        self.config = config
        self.lives = config.lives
        var r = SeededRandom(seed: seed)

        var out: [(prompt: String, answers: [String])] = []
        for e in set.entries {
            let termToDef = (e.term.trimmed, Matching.acceptedAnswers(e.definition))
            let defToTerm = (e.definition.trimmed, Matching.acceptedAnswers(e.term))
            switch config.direction {
            case .termToDef: out.append(termToDef)
            case .defToTerm: out.append(defToTerm)
            case .random: out.append(r.nextBool() ? termToDef : defToTerm)
            }
        }
        self.playable = out.filter { !$0.0.isEmpty && !$0.1.isEmpty }
        self.rng = r
    }

    // MARK: - Wejście

    public func type(_ ch: Character) {
        guard !gameOver, typed.count < 40 else { return }
        let i = typed.index(typed.startIndex, offsetBy: cursor)
        typed.insert(ch, at: i)
        cursor += 1
    }

    public func backspace() {
        guard !gameOver, cursor > 0 else { return }
        let i = typed.index(typed.startIndex, offsetBy: cursor - 1)
        typed.remove(at: i)
        cursor -= 1
    }

    public func cursorLeft() { if cursor > 0 { cursor -= 1 } }
    public func cursorRight() { if cursor < typed.count { cursor += 1 } }

    public func clearTyped() {
        typed = ""
        cursor = 0
    }

    public func setTyped(_ value: String) {
        guard !gameOver else { return }
        typed = String(value.prefix(40))
        cursor = typed.count
    }

    /// Potworki, których odpowiedź zaczyna się od wpisanego tekstu: te się podświetlają.
    public func highlightedIds() -> Set<Int> {
        guard !typed.trimmed.isEmpty else { return [] }
        return Set(monsters.filter { Matching.isPrefixOfAny(typed, $0.answers) }.map(\.id))
    }

    public func highlightedCrateIds() -> Set<Int> {
        guard !typed.trimmed.isEmpty else { return [] }
        return Set(crates.filter { Matching.isPrefixOfAny(typed, $0.answers) }.map(\.id))
    }

    /// Zatwierdza wpisany tekst: strzał do pasującego potworka, zebranie skrzyni
    /// albo zerwanie serii.
    @discardableResult
    public func submit() -> SubmitResult {
        guard !gameOver else { return .ignored }
        let answer = typed
        guard !Matching.normalize(answer).isEmpty else { return .ignored }
        clearTyped()

        let hits = monsters.filter { Matching.isExactMatch(answer, $0.answers) }
        if !hits.isEmpty {
            // Najpierw ten, do którego nic jeszcze nie leci, potem najbliższy działka.
            let target = hits.min { a, b in
                if a.incoming != b.incoming { return a.incoming < b.incoming }
                return distanceToCannon(a.x, a.y) < distanceToCannon(b.x, b.y)
            }!
            let heavy = target.armored && heavyAmmo > 0
            if heavy { heavyAmmo -= 1 }
            if let i = monsters.firstIndex(where: { $0.id == target.id }) {
                monsters[i].incoming += 1
            }
            projectiles.append(
                Projectile(id: nextId, x: Self.cannonX, y: Self.cannonY, targetId: target.id, heavy: heavy)
            )
            nextId += 1
            return .fired(monsterId: target.id, heavy: heavy)
        }

        if let ci = crates.firstIndex(where: { Matching.isExactMatch(answer, $0.answers) }) {
            let crate = crates.remove(at: ci)
            heavyAmmo += crate.amount
            setFlash(.crate)
            return .crateTaken(amount: crate.amount)
        }

        streak = 0
        setFlash(.miss)
        return .miss
    }

    // MARK: - Symulacja

    public func tick(_ dt: Double) {
        guard !gameOver, dt > 0 else { return }
        elapsed += dt

        if flashTTL > 0 {
            flashTTL -= dt
            if flashTTL <= 0 { flash = nil }
        }
        if levelUpBanner > 0 { levelUpBanner -= dt }
        if level != lastLevel {
            lastLevel = level
            levelUpBanner = Self.levelBannerTime
        }
        for i in corpses.indices { corpses[i].ttl -= dt }
        corpses.removeAll { $0.ttl <= 0 }

        moveProjectiles(dt)
        moveMonsters(dt)
        ageCrates(dt)
        maybeSpawnMonster(dt)
        maybeSpawnCrate(dt)
    }

    private func moveProjectiles(_ dt: Double) {
        var landed = Set<Int>()
        for i in projectiles.indices {
            let p = projectiles[i]
            guard let ti = monsters.firstIndex(where: { $0.id == p.targetId }) else {
                landed.insert(p.id)   // cel już zniknął, pocisk się marnuje
                continue
            }
            let dx = monsters[ti].x - p.x
            let dy = monsters[ti].y - p.y
            let dist = (dx * dx + dy * dy).squareRoot()
            let step = Self.projectileSpeed * dt
            if dist <= step || dist < 1e-4 {
                landed.insert(p.id)
                resolveHit(heavy: p.heavy, targetIndex: ti)
            } else {
                projectiles[i].x += dx / dist * step
                projectiles[i].y += dy / dist * step
            }
        }
        projectiles.removeAll { landed.contains($0.id) }
    }

    private func resolveHit(heavy: Bool, targetIndex: Int) {
        monsters[targetIndex].incoming = max(0, monsters[targetIndex].incoming - 1)
        if monsters[targetIndex].armored && !heavy {
            // Pierwszy pocisk tylko zbija pancerz; potrzebne drugie tłumaczenie.
            monsters[targetIndex].armored = false
            monsters[targetIndex].hitFlash = 0.18
            setFlash(.armor)
            return
        }
        let t = monsters[targetIndex]
        corpses.append(
            Corpse(id: nextId, x: t.x, y: t.y, spawnLevel: t.spawnLevel,
                   variant: t.variant, ttl: Self.deathFrameTime)
        )
        nextId += 1
        monsters.remove(at: targetIndex)
        kills += 1
        streak += 1
        if streak > bestStreak { bestStreak = streak }
        score += (10 + 2 * level) * multiplier
        setFlash(.hit)
    }

    private func moveMonsters(_ dt: Double) {
        var reached: [Int] = []
        for i in monsters.indices {
            if monsters[i].hitFlash > 0 { monsters[i].hitFlash -= dt }
            let dx = Self.cannonX - monsters[i].x
            let dy = Self.cannonY - monsters[i].y
            let dist = (dx * dx + dy * dy).squareRoot()
            if dist <= Self.cannonRadius {
                reached.append(monsters[i].id)
                continue
            }
            let step = monsters[i].speed * dt
            monsters[i].x += dx / dist * step
            monsters[i].y += dy / dist * step
        }
        if !reached.isEmpty {
            let gone = Set(reached)
            monsters.removeAll { gone.contains($0.id) }
            projectiles.removeAll { gone.contains($0.targetId) }
            lives -= reached.count
            streak = 0
            setFlash(.lifeLost)
            if lives <= 0 {
                lives = 0
                gameOver = true
            }
        }
    }

    private func ageCrates(_ dt: Double) {
        for i in crates.indices { crates[i].ttl -= dt }
        crates.removeAll { $0.ttl <= 0 }
    }

    func spawnInterval() -> Double {
        max(Self.minSpawnInterval,
            Self.baseSpawnInterval - Double(level - 1) * Self.spawnStepPerLevel)
            * config.tempo.spawnScale
    }

    func monsterSpeed() -> Double {
        (Self.baseSpeed + Double(level - 1) * Self.speedPerLevel) * config.tempo.speedScale
    }

    private func armorChance() -> Double {
        level < 3 ? 0 : min(0.6, Double(level - 2) * 0.12)
    }

    private func maybeSpawnMonster(_ dt: Double) {
        guard config.autoSpawn else { return }
        spawnTimer -= dt
        guard spawnTimer <= 0 else { return }
        spawnTimer = spawnInterval()
        guard monsters.count < Self.maxMonsters else { return }
        spawnMonster()
    }

    public func spawnMonster() {
        guard !playable.isEmpty else { return }
        let taken = Set(monsters.map(\.prompt)).union(crates.map(\.prompt))
        var choices = playable.filter { !taken.contains($0.prompt) }
        if choices.isEmpty { choices = playable }
        let pick = choices[rng.nextInt(choices.count)]
        let fromLeft = rng.nextBool()
        monsters.append(
            Monster(
                id: nextId,
                prompt: pick.prompt,
                answers: pick.answers,
                x: fromLeft ? -0.04 : 1.04,
                y: 0.12 + rng.nextDouble() * 0.76,
                speed: monsterSpeed() * (0.9 + rng.nextDouble() * 0.25),
                armored: rng.nextDouble() < armorChance(),
                variant: rng.nextInt(4),
                spawnLevel: level
            )
        )
        nextId += 1
    }

    private func maybeSpawnCrate(_ dt: Double) {
        guard config.autoSpawn, level >= 2 else { return }
        crateTimer -= dt
        guard crateTimer <= 0 else { return }
        crateTimer = Self.crateInterval
        guard crates.count < 2, !playable.isEmpty else { return }
        let taken = Set(monsters.map(\.prompt)).union(crates.map(\.prompt))
        var choices = playable.filter { !taken.contains($0.prompt) }
        if choices.isEmpty { choices = playable }
        let pick = choices[rng.nextInt(choices.count)]
        crates.append(
            Crate(id: nextId, prompt: pick.prompt, answers: pick.answers,
                  x: 0.12 + rng.nextDouble() * 0.76,
                  y: 0.12 + rng.nextDouble() * 0.5,
                  ttl: Self.crateTTL, amount: Self.crateAmount)
        )
        nextId += 1
    }

    private func setFlash(_ kind: FlashKind) {
        flash = kind
        flashTTL = 0.35
    }

    private func distanceToCannon(_ x: Double, _ y: Double) -> Double {
        let dx = Self.cannonX - x
        let dy = Self.cannonY - y
        return (dx * dx + dy * dy).squareRoot()
    }

    // MARK: - Pomoc dla testów

    /// Wystawia potworka o znanym słowie: używane przez testy, żeby plansza
    /// nie zmieniała się pod ręką w trakcie sprawdzania.
    @discardableResult
    public func debugAddMonster(_ prompt: String, _ definition: String,
                                x: Double, y: Double, armored: Bool = false) -> Monster {
        let m = Monster(
            id: nextId, prompt: prompt, answers: Matching.acceptedAnswers(definition),
            x: x, y: y, speed: monsterSpeed(), armored: armored, variant: 0, spawnLevel: level
        )
        nextId += 1
        monsters.append(m)
        return m
    }

    @discardableResult
    public func debugAddCrate(_ prompt: String, _ definition: String,
                              amount: Int = GameEngine.crateAmount) -> Crate {
        let c = Crate(id: nextId, prompt: prompt, answers: Matching.acceptedAnswers(definition),
                      x: 0.3, y: 0.3, ttl: Self.crateTTL, amount: amount)
        nextId += 1
        crates.append(c)
        return c
    }
}

// MARK: - Typy pomocnicze

public struct GameConfig: Sendable {
    public var lives: Int
    public var direction: Direction
    public var tempo: Tempo
    /// Szew testowy: przy wyłączonych falach test decyduje, co dokładnie stoi na planszy.
    public var autoSpawn: Bool

    public init(lives: Int = 3, direction: Direction = .termToDef,
                tempo: Tempo = .normal, autoSpawn: Bool = true) {
        self.lives = lives
        self.direction = direction
        self.tempo = tempo
        self.autoSpawn = autoSpawn
    }
}

public struct Monster: Identifiable, Equatable, Sendable {
    public let id: Int
    public let prompt: String
    public let answers: [String]
    public var x: Double
    public var y: Double
    public let speed: Double
    public var armored: Bool
    public let variant: Int
    public var incoming: Int = 0
    /// Poziom trudności z chwili pojawienia się: wybiera sprite, więc nie może się zmieniać.
    public let spawnLevel: Int
    /// Odlicza po trafieniu, żeby warstwa rysująca pokazała klatkę uderzenia.
    public var hitFlash: Double = 0
}

public struct Crate: Identifiable, Equatable, Sendable {
    public let id: Int
    public let prompt: String
    public let answers: [String]
    public let x: Double
    public let y: Double
    public var ttl: Double
    public let amount: Int
}

public struct Projectile: Identifiable, Equatable, Sendable {
    public let id: Int
    public var x: Double
    public var y: Double
    public let targetId: Int
    public let heavy: Bool
}

/// Potworek dopiero co zabity, trzymany tylko tak długo, żeby dało się pokazać
/// klatkę śmierci. Pakiet grafiki daje jedną klatkę `_death` i prosi o ~350 ms.
public struct Corpse: Identifiable, Equatable, Sendable {
    public let id: Int
    public let x: Double
    public let y: Double
    public let spawnLevel: Int
    public let variant: Int
    public var ttl: Double
}

public enum FlashKind: Sendable { case hit, armor, miss, crate, lifeLost }

public enum SubmitResult: Equatable, Sendable {
    case fired(monsterId: Int, heavy: Bool)
    case crateTaken(amount: Int)
    case miss
    case ignored
}

/// Własny generator, żeby przebiegi dały się powtórzyć w testach: tak samo jak
/// wstrzykiwany `Random(42)` po stronie Androida. `SystemRandomNumberGenerator`
/// tego nie umie.
public struct SeededRandom: Sendable {
    private var state: UInt64

    public init(seed: UInt64) {
        self.state = seed == 0 ? 0x9E3779B97F4A7C15 : seed
    }

    private mutating func next() -> UInt64 {
        state ^= state << 13
        state ^= state >> 7
        state ^= state << 17
        return state
    }

    public mutating func nextDouble() -> Double {
        Double(next() >> 11) * (1.0 / 9007199254740992.0)   // 2^53
    }

    public mutating func nextInt(_ bound: Int) -> Int {
        precondition(bound > 0, "bound musi być dodatnie")
        return Int(nextDouble() * Double(bound)) % bound
    }

    public mutating func nextBool() -> Bool { next() & 1 == 0 }
}
