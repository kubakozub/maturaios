import XCTest
@testable import MaturaCore

final class SetSearchTests: XCTestCase {

    private let zalety = WordSet(
        id: "a", title: "Człowiek · Charakter: zalety",
        entries: [Entry("agile", "zręczny"), Entry("diligent", "pilny"), Entry("honest", "uczciwy")]
    )
    private let szkola = WordSet(
        id: "b", title: "Edukacja · Szkoła",
        entries: [Entry("pupil", "uczeń"), Entry("diligent", "pilny, sumienny")]
    )
    private let zdrowie = WordSet(
        id: "c", title: "Zdrowie · Dolegliwości",
        entries: [Entry("headache", "ból głowy")]
    )
    private var all: [WordSet] { [zalety, szkola, zdrowie] }

    func testEmptyQueryReturnsEverySetUntouched() {
        let r = SetSearch.search(all, "   ")
        XCTAssertEqual(r.count, 3)
        XCTAssertEqual(r.map(\.set.id), all.map(\.id))
        XCTAssertTrue(r.allSatisfy { $0.entries.isEmpty }, "bez zapytania nie ma czego podświetlać")
    }

    func testSearchingBySetNameFindsIt() {
        let r = SetSearch.search(all, "edukacja")
        XCTAssertEqual(r.map(\.set.id), ["b"])
        XCTAssertTrue(r[0].titleMatch)
    }

    func testSearchingByAWordFindsEverySetThatContainsIt() {
        let r = SetSearch.search(all, "diligent")
        XCTAssertEqual(Set(r.map(\.set.id)), ["a", "b"])
        XCTAssertFalse(r[0].titleMatch, "to trafienie poszło po haśle, nie po nazwie")
        XCTAssertEqual(r[0].entries.first?.term, "diligent")
    }

    func testAPolishTranslationIsSearchableWithoutItsDiacritics() {
        // Klawiatura w grze nie ma ogonków, więc wyszukiwarka też nie może ich wymagać.
        XCTAssertEqual(SetSearch.search(all, "zreczny").map(\.set.id), ["a"])
        XCTAssertEqual(SetSearch.search(all, "zręczny").map(\.set.id), ["a"])
        XCTAssertEqual(SetSearch.search(all, "uczen").map(\.set.id), ["b"])
    }

    func testSearchIsCaseInsensitiveAndMatchesInsideAWord() {
        XCTAssertEqual(SetSearch.search(all, "GŁOWY").map(\.set.id), ["c"])
        XCTAssertEqual(SetSearch.search(all, "ache").map(\.set.id), ["c"])
    }

    func testNameMatchesComeBeforeWordMatches() {
        // „zdrowie" to nazwa drugiego zestawu; gdyby liczyła się tylko kolejność
        // wejściowa, wyszedłby na końcu.
        let mixed = [
            WordSet(id: "x", title: "Sport", entries: [Entry("fitness", "zdrowie fizyczne")]),
            zdrowie,
        ]
        let r = SetSearch.search(mixed, "zdrowie")
        XCTAssertEqual(r.map(\.set.id), ["c", "x"])
        XCTAssertTrue(r[0].titleMatch)
    }

    func testASetWithMoreMatchingEntriesRanksHigher() {
        let duzo = WordSet(id: "duzo", title: "Praca",
                           entries: [Entry("worker", "pracownik"), Entry("workshop", "warsztat")])
        let malo = WordSet(id: "malo", title: "Dom", entries: [Entry("network", "sieć")])
        let r = SetSearch.search([malo, duzo], "work")
        XCTAssertEqual(r.map(\.set.id), ["duzo", "malo"])
        XCTAssertEqual(r[0].entries.count, 2)
    }

    func testNonsenseFindsNothingRatherThanEverything() {
        XCTAssertTrue(SetSearch.search(all, "qqzxw").isEmpty)
    }

    /// Test na prawdziwej zawartości: sprawdza, że indeks radzi sobie z pełnym
    /// kompletem i że szukanie po polskiej stronie naprawdę działa na danych,
    /// które trafiają do gracza, a nie tylko na trzech hasłach z tego pliku.
    func testSearchWorksAcrossTheWholeBuiltInVocabulary() {
        let sets = BuiltInSets.all()
        let idx = SetSearch.Index(sets)
        XCTAssertEqual(idx.search("").count, sets.count)

        let health = idx.search("zdrowie")
        XCTAssertTrue(health.contains { $0.titleMatch && $0.set.title.hasPrefix("Zdrowie") },
                      "nazwa działu Zdrowie musi się znaleźć")

        for h in idx.search("dom") {
            XCTAssertTrue(h.titleMatch || !h.entries.isEmpty, "puste trafienie w \(h.set.title)")
        }
    }
}

/// Liczebnik przy wyniku wyszukiwania. Polski ma trzy formy liczby mnogiej,
/// a najczęstszy błąd to potraktowanie go jak angielskiego — „2 pasujących haseł"
/// zamiast „2 pasujące hasła". Nastki są osobnym wyjątkiem.
final class MatchCountTests: XCTestCase {

    private let pl = Str(.pl)
    private let en = Str(.en)

    func testPolishUsesThreePluralForms() {
        XCTAssertEqual(pl.matchCount(1), "1 pasujące hasło")
        XCTAssertEqual(pl.matchCount(2), "2 pasujące hasła")
        XCTAssertEqual(pl.matchCount(4), "4 pasujące hasła")
        XCTAssertEqual(pl.matchCount(5), "5 pasujących haseł")
        XCTAssertEqual(pl.matchCount(22), "22 pasujące hasła")
        XCTAssertEqual(pl.matchCount(102), "102 pasujące hasła")
    }

    func testPolishTeensAreTheException() {
        XCTAssertEqual(pl.matchCount(12), "12 pasujących haseł")
        XCTAssertEqual(pl.matchCount(13), "13 pasujących haseł")
        XCTAssertEqual(pl.matchCount(14), "14 pasujących haseł")
    }

    func testEnglishNeedsOnlyTwo() {
        XCTAssertEqual(en.matchCount(1), "1 matching entry")
        XCTAssertEqual(en.matchCount(2), "2 matching entries")
        XCTAssertEqual(en.matchCount(12), "12 matching entries")
    }
}
