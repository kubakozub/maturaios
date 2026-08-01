import XCTest
@testable import MaturaCore

final class PersistenceTests: XCTestCase {

    private var dir: URL!

    override func setUpWithError() throws {
        dir = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent("matura-test-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
    }

    override func tearDownWithError() throws {
        try? FileManager.default.removeItem(at: dir)
    }

    func testSaveDataSurvivesAWriteAndReadRoundTrip() {
        let repo = Repository(directory: dir)
        let data = SaveData(
            profile: Profile(name: "Kuba", gamesPlayed: 3, totalKills: 40,
                             bestScore: 900, bestStreak: 7),
            options: Options(lives: 5, soundEnabled: false, texture: .night,
                             direction: .defToTerm, uiLanguage: .en, tempo: .calm),
            sets: [WordSet(id: "own", title: "Mój zestaw",
                           entries: [Entry("dog", "pies")], builtIn: false)],
            scores: [ScoreRecord(playerName: "Kuba", setTitle: "Mój zestaw", score: 900,
                                 level: 4, bestStreak: 7, kills: 40, playedAt: 1_700_000_000)]
        )
        XCTAssertTrue(repo.save(data))

        let back = Repository(directory: dir).load()
        XCTAssertEqual(back.profile.name, "Kuba")
        XCTAssertEqual(back.options.tempo, .calm)
        XCTAssertEqual(back.options.texture, .night)
        XCTAssertEqual(back.sets.first?.entries.first?.definition, "pies")
        XCTAssertEqual(back.scores.first?.score, 900)
        XCTAssertEqual(back, data, "odczyt ma dać dokładnie to, co zapisano")
    }

    func testAnEmptySaveFileFallsBackToDefaultsInsteadOfThrowing() throws {
        try "".write(to: dir.appendingPathComponent(Repository.fileName),
                     atomically: true, encoding: .utf8)
        let loaded = Repository(directory: dir).load()
        XCTAssertEqual(loaded, SaveData())
    }

    func testACorruptedSaveFileFallsBackToDefaults() throws {
        try "{ to nie jest json".write(to: dir.appendingPathComponent(Repository.fileName),
                                       atomically: true, encoding: .utf8)
        let loaded = Repository(directory: dir).load()
        XCTAssertEqual(loaded.profile.name, "Gracz")
        XCTAssertTrue(loaded.sets.isEmpty)
    }

    func testAMissingFileLoadsDefaults() {
        let loaded = Repository(directory: dir).load()
        XCTAssertEqual(loaded, SaveData())
    }

    func testBuiltInSetsAreNotWrittenToDiskOnlyTheOnesThePlayerMade() throws {
        let repo = Repository(directory: dir)
        let own = WordSet(id: "own", title: "Mój", entries: [Entry("dog", "pies")])
        repo.save(SaveData(sets: [own]))

        let raw = try String(contentsOf: dir.appendingPathComponent(Repository.fileName),
                             encoding: .utf8)
        XCTAssertTrue(raw.contains("\"own\""))
        XCTAssertFalse(raw.contains("set000"),
                       "wbudowane zestawy biorą się z kodu, nie z pliku")
        XCTAssertEqual(repo.allSets(custom: [own]).count, BuiltInSets.all().count + 1)
    }

    /// Zestawy z pudełka naprawdę zawierają zderzenia przedrostków, więc
    /// podświetlanie ma na czym pracować — inaczej ta funkcja byłaby ozdobą.
    func testShippedSetsReallyDoContainPrefixCollisions() {
        var collisions = 0
        for set in BuiltInSets.all() {
            let answers = set.entries.compactMap { Matching.acceptedAnswers($0.definition).first }
            for i in answers.indices {
                for j in answers.indices where i != j {
                    if answers[j].hasPrefix(String(answers[i].prefix(3))),
                       answers[i].count >= 3, answers[i] != answers[j] {
                        collisions += 1
                    }
                }
            }
        }
        XCTAssertGreaterThan(collisions, 50,
                             "za mało wspólnych przedrostków, żeby podświetlanie miało sens")
    }
}
