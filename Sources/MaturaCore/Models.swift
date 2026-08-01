import Foundation

/// Jeden wiersz zestawu, dokładnie jak w edytorze ułożonym na wzór Quizleta:
/// hasło po lewej, tłumaczenie po prawej. Tłumaczenie może wymieniać kilka
/// przyjmowanych odpowiedzi po przecinku, np. „konsorcjum, syndykat".
public struct Entry: Codable, Equatable, Hashable, Sendable {
    public var term: String
    public var definition: String

    public init(_ term: String, _ definition: String) {
        self.term = term
        self.definition = definition
    }
}

/// Którą stronę zestawu gracz ma odtworzyć.
public enum Direction: String, Codable, CaseIterable, Sendable {
    case termToDef, defToTerm, random
}

public struct WordSet: Codable, Equatable, Identifiable, Sendable {
    public var id: String
    public var title: String
    public var termLanguage: String
    public var definitionLanguage: String
    public var entries: [Entry]
    public var builtIn: Bool
    public var createdAt: Double
    public var timesPlayed: Int

    public init(
        id: String,
        title: String,
        termLanguage: String = "English",
        definitionLanguage: String = "Polski",
        entries: [Entry] = [],
        builtIn: Bool = false,
        createdAt: Double = 0,
        timesPlayed: Int = 0
    ) {
        self.id = id
        self.title = title
        self.termLanguage = termLanguage
        self.definitionLanguage = definitionLanguage
        self.entries = entries
        self.builtIn = builtIn
        self.createdAt = createdAt
        self.timesPlayed = timesPlayed
    }

    public var size: Int { entries.count }

    /// Zestaw nadaje się do gry, gdy ma choć jeden wiersz wypełniony z obu stron.
    public var isPlayable: Bool {
        entries.contains { !$0.term.trimmed.isEmpty && !$0.definition.trimmed.isEmpty }
    }
}

/// Tempo rozgrywki.
///
/// Wpisywanie na klawiaturze ekranowej idzie ludziom bardzo różnie — od dwóch
/// do czterech liter na sekundę. Przy średniej długości odpowiedzi ośmiu liter
/// daje to od trzech do sześciu sekund na jednego potworka, czyli dwukrotną
/// różnicę w tym, ile gra w ogóle wybacza. Jedno tempo dla wszystkich musiałoby
/// więc krzywdzić albo wolniej piszących, albo szybszych.
///
/// `spawnScale` rozciąga odstęp między potworkami, `speedScale` zmienia tempo
/// ich marszu. Pierwsze decyduje o tym, ile trzeba pisać na minutę, drugie —
/// ile czasu jest na pojedyncze słowo.
public enum Tempo: String, Codable, CaseIterable, Sendable {
    case calm, normal, fast

    public var spawnScale: Double {
        switch self {
        case .calm: return 1.35
        case .normal: return 1
        case .fast: return 0.75
        }
    }

    public var speedScale: Double {
        switch self {
        case .calm: return 0.80
        case .normal: return 1
        case .fast: return 1.25
        }
    }

    public var label: String {
        switch self {
        case .calm: return "CALM"
        case .normal: return "NORM"
        case .fast: return "FAST"
        }
    }
}

public enum Texture: String, Codable, CaseIterable, Sendable {
    case classic, night, desert

    public var tileAsset: String {
        switch self {
        case .classic: return "tile_grass"
        case .night: return "tile_night"
        case .desert: return "tile_sand"
        }
    }

    public var label: String {
        switch self {
        case .classic: return "GRASS"
        case .night: return "NIGHT"
        case .desert: return "SAND"
        }
    }
}

public enum UiLanguage: String, Codable, CaseIterable, Sendable {
    case pl, en
}

public struct Options: Codable, Equatable, Sendable {
    public var lives: Int
    public var soundEnabled: Bool
    public var texture: Texture
    public var direction: Direction
    public var uiLanguage: UiLanguage
    public var tempo: Tempo

    public init(
        lives: Int = 3,
        soundEnabled: Bool = true,
        texture: Texture = .classic,
        direction: Direction = .termToDef,
        uiLanguage: UiLanguage = .pl,
        tempo: Tempo = .normal
    ) {
        self.lives = lives
        self.soundEnabled = soundEnabled
        self.texture = texture
        self.direction = direction
        self.uiLanguage = uiLanguage
        self.tempo = tempo
    }
}

public struct ScoreRecord: Codable, Equatable, Identifiable, Sendable {
    public var id: String
    public var playerName: String
    public var setTitle: String
    public var score: Int
    public var level: Int
    public var bestStreak: Int
    public var kills: Int
    public var playedAt: Double

    public init(
        id: String = UUID().uuidString,
        playerName: String,
        setTitle: String,
        score: Int,
        level: Int,
        bestStreak: Int,
        kills: Int,
        playedAt: Double
    ) {
        self.id = id
        self.playerName = playerName
        self.setTitle = setTitle
        self.score = score
        self.level = level
        self.bestStreak = bestStreak
        self.kills = kills
        self.playedAt = playedAt
    }
}

public struct Profile: Codable, Equatable, Sendable {
    public var name: String
    public var anonymous: Bool
    public var gamesPlayed: Int
    public var totalKills: Int
    public var bestScore: Int
    public var bestStreak: Int

    public init(
        name: String = "Gracz",
        anonymous: Bool = true,
        gamesPlayed: Int = 0,
        totalKills: Int = 0,
        bestScore: Int = 0,
        bestStreak: Int = 0
    ) {
        self.name = name
        self.anonymous = anonymous
        self.gamesPlayed = gamesPlayed
        self.totalKills = totalKills
        self.bestScore = bestScore
        self.bestStreak = bestStreak
    }
}

/// Odznaki przyznawane z liczników w `Profile`. Czyste dane, bez typów systemowych.
public enum Achievement: String, CaseIterable, Identifiable, Sendable {
    case firstBlood, rookie, veteran, sharpshooter
    case comboX3, comboX5, score500, score2000

    public var id: String { rawValue }

    public func title(_ lang: UiLanguage) -> String {
        switch (self, lang) {
        case (.firstBlood, .pl): return "Pierwsza krew"
        case (.firstBlood, .en): return "First blood"
        case (.rookie, .pl): return "Rekrut"
        case (.rookie, .en): return "Rookie"
        case (.veteran, .pl): return "Weteran"
        case (.veteran, .en): return "Veteran"
        case (.sharpshooter, .pl): return "Strzelec wyborowy"
        case (.sharpshooter, .en): return "Sharpshooter"
        case (.comboX3, .pl): return "Seria x3"
        case (.comboX3, .en): return "Combo x3"
        case (.comboX5, .pl): return "Seria x5"
        case (.comboX5, .en): return "Combo x5"
        case (.score500, .pl): return "Pięćset"
        case (.score500, .en): return "Five hundred"
        case (.score2000, .pl): return "Dwa tysiące"
        case (.score2000, .en): return "Two thousand"
        }
    }

    public func desc(_ lang: UiLanguage) -> String {
        switch (self, lang) {
        case (.firstBlood, .pl): return "Zabij pierwszego potworka"
        case (.firstBlood, .en): return "Kill your first monster"
        case (.rookie, .pl): return "Rozegraj 5 gier"
        case (.rookie, .en): return "Play 5 games"
        case (.veteran, .pl): return "Rozegraj 25 gier"
        case (.veteran, .en): return "Play 25 games"
        case (.sharpshooter, .pl): return "Zabij 100 potworków"
        case (.sharpshooter, .en): return "Kill 100 monsters"
        case (.comboX3, .pl): return "Osiągnij mnożnik x3"
        case (.comboX3, .en): return "Reach the x3 multiplier"
        case (.comboX5, .pl): return "Osiągnij mnożnik x5"
        case (.comboX5, .en): return "Reach the x5 multiplier"
        case (.score500, .pl): return "Zdobądź 500 punktów w jednej grze"
        case (.score500, .en): return "Score 500 in a single game"
        case (.score2000, .pl): return "Zdobądź 2000 punktów w jednej grze"
        case (.score2000, .en): return "Score 2000 in a single game"
        }
    }

    public var iconAsset: String {
        switch self {
        case .firstBlood: return "medal_bronze"
        case .rookie: return "medal_bronze"
        case .veteran: return "medal_silver"
        case .sharpshooter: return "medal_silver"
        case .comboX3: return "medal_gold"
        case .comboX5: return "medal_gold"
        case .score500: return "icon_trophy"
        case .score2000: return "icon_trophy"
        }
    }

    public func unlocked(by p: Profile) -> Bool {
        switch self {
        case .firstBlood: return p.totalKills >= 1
        case .rookie: return p.gamesPlayed >= 5
        case .veteran: return p.gamesPlayed >= 25
        case .sharpshooter: return p.totalKills >= 100
        case .comboX3: return p.bestStreak >= 6
        case .comboX5: return p.bestStreak >= 12
        case .score500: return p.bestScore >= 500
        case .score2000: return p.bestScore >= 2000
        }
    }
}

public struct SaveData: Codable, Equatable, Sendable {
    public var profile: Profile
    public var options: Options
    public var sets: [WordSet]
    public var scores: [ScoreRecord]

    public init(
        profile: Profile = Profile(),
        options: Options = Options(),
        sets: [WordSet] = [],
        scores: [ScoreRecord] = []
    ) {
        self.profile = profile
        self.options = options
        self.sets = sets
        self.scores = scores
    }
}

extension String {
    var trimmed: String { trimmingCharacters(in: .whitespacesAndNewlines) }
}
