import Foundation
import SwiftUI
import MaturaCore

/// Ekrany aplikacji. Stos jest płaski, bo nawigacja też jest płaska: z menu
/// wchodzi się w jedno miejsce i wraca.
enum Screen: Equatable {
    case start
    case menu
    case setPick
    case modePick(WordSet)
    case play(WordSet)
    case editor(WordSet?)
    case options
    case achievements
    case scores
}

@MainActor
final class AppState: ObservableObject {

    @Published var screen: Screen = .start
    @Published var profile: Profile
    @Published var options: Options
    @Published var customSets: [WordSet]
    @Published var scores: [ScoreRecord]

    private let repo: Repository

    var str: Str { Str(options.uiLanguage) }
    var allSets: [WordSet] { BuiltInSets.all() + customSets }

    init(repo: Repository = Repository(directory: Repository.defaultDirectory())) {
        self.repo = repo
        let d = repo.load()
        self.profile = d.profile
        self.options = d.options
        self.customSets = d.sets
        self.scores = d.scores
    }

    func persist() {
        repo.save(SaveData(profile: profile, options: options,
                           sets: customSets, scores: scores))
    }

    func startPlaying(as name: String) {
        profile.name = name.trimmed.isEmpty ? "Gracz" : name.trimmed
        persist()
        screen = .menu
    }

    func upsert(_ set: WordSet) {
        if let i = customSets.firstIndex(where: { $0.id == set.id }) {
            customSets[i] = set
        } else {
            customSets.append(set)
        }
        persist()
    }

    /// Wbudowanych nie da się skasować — usuwanie dotyczy tylko własnych zestawów.
    func delete(setId: String) {
        customSets.removeAll { $0.id == setId }
        persist()
    }

    func canDelete(_ set: WordSet) -> Bool {
        customSets.contains { $0.id == set.id }
    }

    /// Zapisuje wynik i podbija liczniki, z których biorą się odznaki.
    func finish(set: WordSet, score: Int, level: Int, bestStreak: Int, kills: Int) {
        scores.insert(
            ScoreRecord(playerName: profile.name, setTitle: set.title, score: score,
                        level: level, bestStreak: bestStreak, kills: kills,
                        playedAt: Date().timeIntervalSince1970),
            at: 0
        )
        if scores.count > 50 { scores = Array(scores.prefix(50)) }
        profile.gamesPlayed += 1
        profile.totalKills += kills
        profile.bestScore = max(profile.bestScore, score)
        profile.bestStreak = max(profile.bestStreak, bestStreak)
        persist()
    }

    var unlockedAchievements: [Achievement] {
        Achievement.allCases.filter { $0.unlocked(by: profile) }
    }
}

private extension String {
    var trimmed: String { trimmingCharacters(in: .whitespacesAndNewlines) }
}
