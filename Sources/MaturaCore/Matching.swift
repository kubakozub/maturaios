import Foundation

/// Normalizacja i dopasowywanie odpowiedzi.
///
/// Klawiatura narysowana w grze ma tylko A–Z, spację, cofanie i strzałki — nie
/// ma polskich znaków. Gracz fizycznie nie jest w stanie wpisać „zręczny", więc
/// porównanie musi pomijać ogonki, inaczej gra byłaby nie do przejścia własną
/// klawiaturą. Wielkość liter i powtórzone spacje też nie mają znaczenia.
public enum Matching {

    private static let fold: [Character: Character] = [
        "ą": "a", "ć": "c", "ę": "e", "ł": "l", "ń": "n",
        "ó": "o", "ś": "s", "ź": "z", "ż": "z",
        "á": "a", "à": "a", "â": "a", "ä": "a", "ã": "a", "å": "a",
        "é": "e", "è": "e", "ê": "e", "ë": "e",
        "í": "i", "ì": "i", "î": "i", "ï": "i",
        "ò": "o", "ô": "o", "ö": "o", "õ": "o", "ø": "o",
        "ú": "u", "ù": "u", "û": "u", "ü": "u",
        "ý": "y", "ÿ": "y", "ñ": "n", "ç": "c", "š": "s", "ž": "z",
        "đ": "d", "ð": "d", "þ": "t", "ı": "i",
    ]

    /// Małe litery, bez ogonków, znaki spoza alfanumerycznych zwinięte do
    /// pojedynczych spacji, obcięte z brzegów.
    public static func normalize(_ raw: String) -> String {
        var out = ""
        out.reserveCapacity(raw.count)
        var lastWasSpace = true
        for ch in raw.lowercased() {
            let folded = fold[ch] ?? ch
            if folded.isLetter || folded.isNumber {
                out.append(folded)
                lastWasSpace = false
            } else if !lastWasSpace {
                out.append(" ")
                lastWasSpace = true
            }
        }
        return out.trimmed
    }

    /// Rozbija komórkę tłumaczenia na każdą odpowiedź, którą należy przyjąć.
    ///
    /// „konsorcjum, syndykat (związek przedsiębiorstw)" przyjmuje:
    ///   - całą komórkę,
    ///   - „konsorcjum",
    ///   - „syndykat (związek przedsiębiorstw)" oraz „syndykat" bez dopisku.
    ///
    /// Nawias traktujemy jak objaśnienie, a nie część odpowiedzi — gracz na
    /// ograniczonej klawiaturze i tak nie wpisze nawiasów.
    public static func acceptedAnswers(_ definition: String) -> [String] {
        var out: [String] = []
        var seen = Set<String>()
        func add(_ s: String) {
            let n = normalize(s)
            if !n.isEmpty, seen.insert(n).inserted { out.append(n) }
        }
        add(definition)
        for part in definition.split(whereSeparator: { $0 == "," || $0 == ";" || $0 == "/" }) {
            let piece = String(part)
            add(piece)
            add(stripParentheses(piece))
        }
        return out
    }

    private static func stripParentheses(_ s: String) -> String {
        var out = ""
        var depth = 0
        for ch in s {
            if ch == "(" { depth += 1; out.append(" ") }
            else if ch == ")" { depth = max(0, depth - 1); out.append(" ") }
            else if depth == 0 { out.append(ch) }
        }
        return out
    }

    /// Prawda, gdy wpisany tekst jest początkiem którejkolwiek odpowiedzi.
    /// Puste wejście nie podświetla niczego.
    public static func isPrefixOfAny(_ typed: String, _ answers: [String]) -> Bool {
        let t = normalize(typed)
        guard !t.isEmpty else { return false }
        return answers.contains { $0.hasPrefix(t) }
    }

    /// Prawda, gdy wpisany tekst jest równy którejś z odpowiedzi.
    public static func isExactMatch(_ typed: String, _ answers: [String]) -> Bool {
        let t = normalize(typed)
        guard !t.isEmpty else { return false }
        return answers.contains(t)
    }
}
