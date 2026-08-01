import XCTest
@testable import MaturaCore

final class MatchingTests: XCTestCase {

    func testDiacriticsAreFoldedSoTheAZKeyboardCanTypePolishAnswers() {
        XCTAssertEqual(Matching.normalize("zręczny"), "zreczny")
        XCTAssertEqual(Matching.normalize("ciekawość"), "ciekawosc")
        XCTAssertEqual(Matching.normalize("żółw"), "zolw")
        XCTAssertEqual(Matching.normalize("łąka"), "laka")
    }

    func testNormalisationIsCaseAndWhitespaceInsensitive() {
        XCTAssertEqual(Matching.normalize("  Angel   INVESTOR "), "angel investor")
        XCTAssertEqual(Matching.normalize("angel investor"), "angel investor")
    }

    func testCommaSeparatedDefinitionsEachCountAsAnAcceptedAnswer() {
        let a = Matching.acceptedAnswers("konsorcjum, syndykat (związek przedsiębiorstw)")
        XCTAssertTrue(a.contains("konsorcjum"))
        XCTAssertTrue(a.contains("syndykat"))
        XCTAssertTrue(a.contains("syndykat zwiazek przedsiebiorstw"))
    }

    func testParentheticalGlossIsOptional() {
        let a = Matching.acceptedAnswers("indywidualny inwestor (inw. w spółkę)")
        XCTAssertTrue(a.contains("indywidualny inwestor"))
    }

    func testPrefixHighlightingMatchesTheWorkedExampleFromTheDesignDocument() {
        // Dokument: wpisanie „cie" ma podświetlić i „ciekawość", i „cierpki".
        let curiosity = Matching.acceptedAnswers("ciekawość")
        let tart = Matching.acceptedAnswers("cierpki")
        XCTAssertTrue(Matching.isPrefixOfAny("cie", curiosity))
        XCTAssertTrue(Matching.isPrefixOfAny("cie", tart))
        XCTAssertTrue(Matching.isPrefixOfAny("ciek", curiosity))
        XCTAssertFalse(Matching.isPrefixOfAny("ciek", tart))
    }

    func testEmptyInputHighlightsNothing() {
        XCTAssertFalse(Matching.isPrefixOfAny("", ["cokolwiek"]))
        XCTAssertFalse(Matching.isPrefixOfAny("   ", ["cokolwiek"]))
    }

    func testExactMatchIgnoresDiacriticsAndCase() {
        let ans = Matching.acceptedAnswers("zręczny")
        XCTAssertTrue(Matching.isExactMatch("ZRECZNY", ans))
        XCTAssertTrue(Matching.isExactMatch("zręczny", ans))
        XCTAssertFalse(Matching.isExactMatch("zreczn", ans))
    }
}
