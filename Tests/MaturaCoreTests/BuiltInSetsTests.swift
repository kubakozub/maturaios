import XCTest
@testable import MaturaCore

/// Wbudowane słownictwo jest generowane, więc te testy są barierką: psują build,
/// jeśli kolejne wygenerowanie złamie reguły, których treść ma przestrzegać.
final class BuiltInSetsTests: XCTestCase {

    private func wordCount(_ s: String) -> Int {
        s.split(whereSeparator: \.isWhitespace).count
    }

    func testEveryTermIsAtMostTwoWords() {
        let offenders = BuiltInSets.all().flatMap { set in
            set.entries.filter { wordCount($0.term) > 2 }.map { "\(set.title): '\($0.term)'" }
        }
        XCTAssertTrue(offenders.isEmpty, "hasła dłuższe niż dwa słowa: \(offenders)")
    }

    func testEveryTranslationAlternativeIsAtMostTwoWords() {
        let offenders = BuiltInSets.all().flatMap { set in
            set.entries.flatMap { e in
                e.definition.split(separator: ",")
                    .filter { wordCount(String($0)) > 2 }
                    .map { "\(set.title): '\(e.term)' -> '\(String($0).trimmed)'" }
            }
        }
        XCTAssertTrue(offenders.isEmpty, "tłumaczenia dłuższe niż dwa słowa: \(offenders)")
    }

    func testNoSetIsEmptyAndNoEntryHasABlankSide() {
        for set in BuiltInSets.all() {
            XCTAssertFalse(set.entries.isEmpty, "\(set.title) jest pusty")
            for e in set.entries {
                XCTAssertFalse(e.term.trimmed.isEmpty, "\(set.title): puste hasło")
                XCTAssertFalse(e.definition.trimmed.isEmpty,
                               "\(set.title): puste tłumaczenie dla '\(e.term)'")
            }
        }
    }

    func testSetIdsAndTitlesAreUnique() {
        let sets = BuiltInSets.all()
        XCTAssertEqual(Set(sets.map(\.id)).count, sets.count, "powtórzone identyfikatory")
        XCTAssertEqual(Set(sets.map(\.title)).count, sets.count, "powtórzone nazwy")
    }

    func testNoSetRepeatsATerm() {
        for set in BuiltInSets.all() {
            let terms = set.entries.map { Matching.normalize($0.term) }
            XCTAssertEqual(Set(terms).count, terms.count, "\(set.title) powtarza hasło")
        }
    }

    func testEveryEntryProducesATypeableAnswerOnTheAZKeyboard() {
        let allowed = Set("abcdefghijklmnopqrstuvwxyz0123456789 ")
        for set in BuiltInSets.all() {
            for e in set.entries {
                let answers = Matching.acceptedAnswers(e.definition)
                XCTAssertFalse(answers.isEmpty, "\(set.title): '\(e.term)' bez odpowiedzi")
                let typeable = answers.contains { $0.allSatisfy { allowed.contains($0) } }
                XCTAssertTrue(typeable,
                              "\(set.title): '\(e.term)' -> '\(e.definition)' nie da się wpisać")
            }
        }
    }

    func testEverySetIsPlayableAndCanBeClearedByTypingTheAnswers() {
        for set in BuiltInSets.all() {
            let e = GameEngine(set: set, config: GameConfig(lives: 99, autoSpawn: false), seed: 7)
            XCTAssertTrue(e.isPlayable, "\(set.title) nie nadaje się do gry")
            let first = set.entries[0]
            e.debugAddMonster(first.term, first.definition, x: 0.9, y: 0.5)
            e.setTyped(Matching.acceptedAnswers(first.definition)[0])
            guard case .fired = e.submit() else {
                return XCTFail("\(set.title): pierwsze hasło nie trafia")
            }
        }
    }

    func testAllFourteenMaturaTopicAreasArePresent() {
        let expected = [
            "Człowiek", "Miejsce zamieszkania", "Edukacja", "Praca", "Życie prywatne",
            "Żywienie", "Zakupy", "Podróże", "Kultura", "Sport", "Zdrowie",
            "Nauka i technika", "Przyroda", "Życie społeczne",
        ]
        let areas = Set(BuiltInSets.all().map { $0.title.components(separatedBy: " · ")[0] })
        XCTAssertEqual(areas.count, 14)
        for a in expected {
            XCTAssertTrue(areas.contains(a), "brakuje działu \(a)")
        }
    }

    /// Zestaw ma pokazać każde słowo kilka razy w jednej rozgrywce — przy stu
    /// hasłach słowo wracałoby raz na kwadrans, czyli praktycznie nigdy.
    func testEverySetIsSmallEnoughToBeClearedInOneRun() {
        let tooBig = BuiltInSets.all().filter { $0.entries.count > 25 }
            .map { "\($0.title) (\($0.entries.count))" }
        XCTAssertTrue(tooBig.isEmpty, "zestawy powyżej 25 haseł: \(tooBig)")
    }

    func testTheCollectionIsLargeEnoughToBeWorthStudying() {
        let sets = BuiltInSets.all()
        XCTAssertEqual(sets.count, 102)
        XCTAssertEqual(sets.reduce(0) { $0 + $1.entries.count }, 2084)
    }
}
