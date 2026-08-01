import XCTest
@testable import MaturaCore

final class GameEngineTests: XCTestCase {

    /// Fale automatyczne są wyłączone, żeby każdy test decydował, co dokładnie
    /// stoi na planszy; inaczej potworek pojawiający się w środku sprawdzenia
    /// psułby liczby. Samo pojawianie się sprawdza osobny test niżej.
    private func engine(lives: Int = 3) -> GameEngine {
        GameEngine(
            set: WordSet(
                id: "t", title: "test",
                entries: [
                    Entry("agile", "zręczny"),
                    Entry("curiosity", "ciekawość"),
                    Entry("tart", "cierpki"),
                ]
            ),
            config: GameConfig(lives: lives, direction: .termToDef, autoSpawn: false),
            seed: 42
        )
    }

    /// Przesuwa czas, aż wszystkie pociski dolecą.
    private func resolveShots(_ e: GameEngine, maxSteps: Int = 400) {
        var n = 0
        while !e.projectiles.isEmpty && n < maxSteps {
            e.tick(0.016)
            n += 1
        }
    }

    func testCorrectAnswerFiresAndTheProjectileKillsAnUnarmouredMonster() {
        let e = engine()
        let m = e.debugAddMonster("agile", "zręczny", x: 0.9, y: 0.5)
        e.setTyped("zreczny")
        let r = e.submit()
        if case .fired = r {} else { XCTFail("miał paść strzał, było \(r)") }
        XCTAssertEqual(e.projectiles.count, 1)

        resolveShots(e)

        XCTAssertFalse(e.monsters.contains { $0.id == m.id })
        XCTAssertEqual(e.kills, 1)
        XCTAssertGreaterThan(e.score, 0)
    }

    func testArmouredMonsterSurvivesTheFirstShotAndDiesOnTheSecond() {
        let e = engine()
        e.debugAddMonster("agile", "zręczny", x: 0.9, y: 0.5, armored: true)

        e.setTyped("zreczny"); e.submit()
        resolveShots(e)
        XCTAssertEqual(e.monsters.count, 1, "pancerz ma wchłonąć pierwsze trafienie")
        XCTAssertFalse(e.monsters[0].armored, "pancerz zbity")
        XCTAssertEqual(e.kills, 0)

        e.setTyped("zreczny"); e.submit()
        resolveShots(e)
        XCTAssertTrue(e.monsters.isEmpty)
        XCTAssertEqual(e.kills, 1)
    }

    func testHeavyAmmunitionDestroysAnArmouredMonsterInOneShotAndIsConsumed() {
        let e = engine()
        e.debugAddCrate("curiosity", "ciekawość", amount: 3)
        e.setTyped("ciekawosc")
        if case .crateTaken = e.submit() {} else { XCTFail("skrzynia miała zostać zebrana") }
        XCTAssertEqual(e.heavyAmmo, 3)

        e.debugAddMonster("agile", "zręczny", x: 0.9, y: 0.5, armored: true)
        e.setTyped("zreczny"); e.submit()
        XCTAssertEqual(e.heavyAmmo, 2, "mocniejszy nabój schodzi w chwili strzału")
        resolveShots(e)
        XCTAssertTrue(e.monsters.isEmpty)
        XCTAssertEqual(e.kills, 1)
    }

    func testBasicAmmunitionIsUnlimited() {
        let e = engine()
        for _ in 0..<5 {
            e.debugAddMonster("agile", "zręczny", x: 0.9, y: 0.5)
            e.setTyped("zreczny"); e.submit()
            resolveShots(e)
        }
        XCTAssertEqual(e.kills, 5)
        XCTAssertEqual(e.heavyAmmo, 0)
    }

    func testMultiplierClimbsWithConsecutiveKills() {
        let e = engine()
        var seen: [Int] = []
        for _ in 0..<13 {
            e.debugAddMonster("agile", "zręczny", x: 0.9, y: 0.5)
            e.setTyped("zreczny"); e.submit()
            resolveShots(e)
            seen.append(e.multiplier)
        }
        // po 3 zabiciach x2, po 6 x3, po 9 x4, po 12 x5
        XCTAssertEqual(seen[1], 1)
        XCTAssertEqual(seen[2], 2)
        XCTAssertEqual(seen[5], 3)
        XCTAssertEqual(seen[8], 4)
        XCTAssertEqual(seen[11], 5)
    }

    func testAWrongAnswerBreaksTheStreakButCostsNoLife() {
        let e = engine()
        for _ in 0..<3 {
            e.debugAddMonster("agile", "zręczny", x: 0.9, y: 0.5)
            e.setTyped("zreczny"); e.submit()
            resolveShots(e)
        }
        XCTAssertEqual(e.multiplier, 2)
        e.setTyped("kompletnie zle")
        XCTAssertEqual(e.submit(), .miss)
        XCTAssertEqual(e.multiplier, 1)
        XCTAssertEqual(e.lives, 3)
    }

    func testAMonsterReachingTheCannonCostsALifeAndResetsTheStreak() {
        let e = engine(lives: 2)
        for _ in 0..<3 {
            e.debugAddMonster("agile", "zręczny", x: 0.9, y: 0.5)
            e.setTyped("zreczny"); e.submit()
            resolveShots(e)
        }
        XCTAssertEqual(e.multiplier, 2)

        e.debugAddMonster("tart", "cierpki",
                          x: GameEngine.cannonX + 0.061, y: GameEngine.cannonY)
        for _ in 0..<120 { e.tick(0.05) }

        XCTAssertEqual(e.lives, 1)
        XCTAssertEqual(e.multiplier, 1)
        XCTAssertFalse(e.gameOver)
    }

    func testLosingEveryLifeEndsTheGame() {
        let e = engine(lives: 1)
        e.debugAddMonster("tart", "cierpki",
                          x: GameEngine.cannonX + 0.061, y: GameEngine.cannonY)
        for _ in 0..<120 { e.tick(0.05) }
        XCTAssertEqual(e.lives, 0)
        XCTAssertTrue(e.gameOver)
        XCTAssertEqual(e.submit(), .ignored, "po końcu gry nic już nie działa")
    }

    func testDifficultyLevelRisesEverySixKills() {
        let e = engine()
        func killOne() {
            e.debugAddMonster("agile", "zręczny", x: 0.9, y: 0.5)
            e.setTyped("zreczny"); e.submit()
            resolveShots(e)
        }
        XCTAssertEqual(e.level, 1)
        for _ in 0..<5 { killOne() }
        XCTAssertEqual(e.level, 1, "piąte zabicie to jeszcze pierwszy poziom")
        killOne()
        XCTAssertEqual(e.level, 2, "szóste zabicie podnosi poziom")
        for _ in 0..<6 { killOne() }
        XCTAssertEqual(e.level, 3)
    }

    /// Tempo ma realnie zmieniać grę, a nie tylko podświetlać inny przycisk.
    /// Mierzymy to jedyną rzeczą, którą widać z zewnątrz: ile potworków wejdzie
    /// na planszę przez tę samą minutę.
    func testPaceChangesHowDenselyMonstersArrive() {
        func monstersAfterAMinute(_ tempo: Tempo) -> Int {
            let e = GameEngine(
                set: WordSet(id: "t", title: "t",
                             entries: (0..<20).map { Entry("w\($0)", "s\($0)") }),
                config: GameConfig(lives: 99, tempo: tempo, autoSpawn: true),
                seed: 11
            )
            for _ in 0..<1200 { e.tick(0.05) }   // 60 sekund
            return e.monsters.count + (99 - e.lives)
        }
        let calm = monstersAfterAMinute(.calm)
        let normal = monstersAfterAMinute(.normal)
        let fast = monstersAfterAMinute(.fast)
        XCTAssertLessThan(calm, normal, "spokojne ma dawać mniej niż normalne")
        XCTAssertGreaterThan(fast, normal, "szybkie ma dawać więcej niż normalne")
    }

    func testCalmPaceGivesMoreTimeBeforeAMonsterReachesTheCannon() {
        func secondsToCannon(_ tempo: Tempo) -> Double {
            let e = GameEngine(
                set: WordSet(id: "t", title: "t", entries: [Entry("agile", "zręczny")]),
                config: GameConfig(lives: 1, tempo: tempo, autoSpawn: false),
                seed: 5
            )
            e.debugAddMonster("agile", "zręczny", x: 0.0, y: 0.5)
            var t = 0.0
            while !e.gameOver && t < 120 { e.tick(0.02); t += 0.02 }
            return t
        }
        let calm = secondsToCannon(.calm)
        let fast = secondsToCannon(.fast)
        XCTAssertGreaterThan(calm, fast * 1.4, "spokojne ma dawać wyraźnie więcej czasu")
    }

    func testTypingHighlightsEveryMonsterWhoseAnswerSharesThePrefix() {
        let e = engine()
        let curiosity = e.debugAddMonster("curiosity", "ciekawość", x: 0.2, y: 0.3)
        let tart = e.debugAddMonster("tart", "cierpki", x: 0.8, y: 0.7)
        let agile = e.debugAddMonster("agile", "zręczny", x: 0.8, y: 0.2)

        e.setTyped("cie")
        let both = e.highlightedIds()
        XCTAssertTrue(both.contains(curiosity.id))
        XCTAssertTrue(both.contains(tart.id))
        XCTAssertFalse(both.contains(agile.id))

        e.setTyped("ciek")
        XCTAssertEqual(e.highlightedIds(), [curiosity.id])
    }

    func testEmptyInputHighlightsNothing() {
        let e = engine()
        e.debugAddMonster("agile", "zręczny", x: 0.9, y: 0.5)
        e.clearTyped()
        XCTAssertTrue(e.highlightedIds().isEmpty)
    }

    func testTypingRespectsTheCursor() {
        let e = engine()
        e.setTyped("zecny")
        e.cursorLeft(); e.cursorLeft(); e.cursorLeft()   // za „z"... czyli po „ze"
        XCTAssertEqual(e.cursor, 2)
        e.type("r")
        XCTAssertEqual(e.typed, "zercny")
    }

    func testBackspaceRemovesTheCharacterBeforeTheCursor() {
        let e = engine()
        e.setTyped("abc")
        e.backspace()
        XCTAssertEqual(e.typed, "ab")
        e.cursorLeft()
        e.backspace()
        XCTAssertEqual(e.typed, "b")
    }

    func testTypedTextIsCappedSoTheFieldCannotOverflow() {
        let e = engine()
        for _ in 0..<60 { e.type("a") }
        XCTAssertEqual(e.typed.count, 40)
    }

    func testSubmittingNothingIsIgnored() {
        let e = engine()
        e.clearTyped()
        XCTAssertEqual(e.submit(), .ignored)
        e.setTyped("   ")
        XCTAssertEqual(e.submit(), .ignored)
    }

    func testShotsPreferAMonsterNothingIsFlyingAtYet() {
        let e = engine()
        let first = e.debugAddMonster("agile", "zręczny", x: 0.62, y: 0.5)
        let second = e.debugAddMonster("agile", "zręczny", x: 0.95, y: 0.5)

        e.setTyped("zreczny")
        guard case .fired(let id1, _) = e.submit() else { return XCTFail("brak strzału") }
        XCTAssertEqual(id1, first.id, "najpierw najbliższy")

        e.setTyped("zreczny")
        guard case .fired(let id2, _) = e.submit() else { return XCTFail("brak drugiego strzału") }
        XCTAssertEqual(id2, second.id, "drugi strzał nie marnuje się na ten sam cel")
    }

    func testTheFieldDoesNotOverflowWithMonsters() {
        let e = GameEngine(
            set: WordSet(id: "t", title: "t",
                         entries: [Entry("agile", "zręczny"), Entry("curiosity", "ciekawość")]),
            config: GameConfig(lives: 99, autoSpawn: true),
            seed: 3
        )
        for _ in 0..<2000 { e.tick(0.05) }
        XCTAssertLessThanOrEqual(e.monsters.count, GameEngine.maxMonsters)
    }

    func testAHitRaisesAFlashTheUICanReactTo() {
        let e = engine()
        e.debugAddMonster("agile", "zręczny", x: 0.9, y: 0.5)
        e.setTyped("zreczny"); e.submit()
        resolveShots(e)
        XCTAssertEqual(e.flash, .hit)
    }

    func testCratesExpireOnTheirOwn() {
        let e = engine()
        e.debugAddCrate("curiosity", "ciekawość")
        XCTAssertEqual(e.crates.count, 1)
        for _ in 0..<400 { e.tick(0.05) }     // 20 s, a skrzynia żyje 13 s
        XCTAssertTrue(e.crates.isEmpty)
    }

    func testASetWithNothingTypeableIsNotPlayable() {
        let e = GameEngine(
            set: WordSet(id: "x", title: "x", entries: [Entry("  ", "  ")]),
            config: GameConfig(autoSpawn: false),
            seed: 1
        )
        XCTAssertFalse(e.isPlayable)
        e.spawnMonster()
        XCTAssertTrue(e.monsters.isEmpty, "z pustego zestawu nie ma czego wystawić")
    }

    func testTheGameKeepsRunningWithoutInput() {
        let e = engine(lives: 99)
        e.debugAddMonster("agile", "zręczny", x: 0.0, y: 0.5)
        let before = e.monsters[0].x
        e.tick(1.0)
        XCTAssertGreaterThan(e.monsters[0].x, before, "potworek ma iść w stronę działka")
        XCTAssertEqual(e.elapsed, 1.0, accuracy: 1e-9)
    }
}
