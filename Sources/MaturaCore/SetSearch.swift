import Foundation

/// Wyszukiwanie zestawów — po nazwie i po hasłach w środku.
///
/// Przy stu dwóch zestawach lista przewija się długo, a pytanie, które gracz
/// naprawdę sobie zadaje, brzmi zwykle „w którym zestawie jest to słowo", a nie
/// „jak nazywa się dział". Dlatego zapytanie sprawdzane jest w obu miejscach:
/// w tytule i w każdym haśle oraz tłumaczeniu.
///
/// Porównanie przechodzi przez `Matching.normalize`, więc wpisane „zreczny"
/// znajdzie „zręczny", a „edukacja" znajdzie „Edukacja · Szkoła". To ta sama
/// reguła, którą gra stosuje do odpowiedzi, więc wyszukiwarka zachowuje się tak,
/// jak gracz zdążył się nauczyć.
public enum SetSearch {

    /// - `titleMatch`: czy trafienie poszło przez nazwę zestawu — takie idą na
    ///   górę, bo kto wpisuje nazwę działu, ten szuka działu, a nie słowa.
    /// - `entries`: hasła, które pasują; puste, gdy trafienie było tylko po nazwie.
    public struct Hit: Identifiable, Equatable {
        public let set: WordSet
        public let titleMatch: Bool
        public let entries: [Entry]

        public var id: String { self.set.id }
    }

    /// Indeks liczony raz na listę zestawów, nie na każde naciśnięcie klawisza.
    public struct Index {
        private struct Row {
            let set: WordSet
            let title: String
            let entries: [(entry: Entry, haystack: String)]
        }

        private let rows: [Row]

        public init(_ sets: [WordSet]) {
            rows = sets.map { s in
                Row(
                    set: s,
                    title: Matching.normalize(s.title),
                    entries: s.entries.map {
                        ($0, Matching.normalize($0.term) + " " + Matching.normalize($0.definition))
                    }
                )
            }
        }

        public func search(_ query: String) -> [Hit] {
            let q = Matching.normalize(query)
            if q.isEmpty {
                return rows.map { Hit(set: $0.set, titleMatch: false, entries: []) }
            }

            var byTitle: [Hit] = []
            var byWord: [Hit] = []
            for r in rows {
                let hitTitle = r.title.contains(q)
                let hitEntries = r.entries.filter { $0.haystack.contains(q) }.map(\.entry)
                if hitTitle {
                    byTitle.append(Hit(set: r.set, titleMatch: true, entries: hitEntries))
                } else if !hitEntries.isEmpty {
                    byWord.append(Hit(set: r.set, titleMatch: false, entries: hitEntries))
                }
            }
            // Wśród trafień po słowach najpierw te, w których pasuje ich najwięcej.
            // Sortowanie w Swifcie nie jest stabilne, więc remisy rozstrzyga
            // pozycja wyjściowa — inaczej kolejność potrafiłaby skakać.
            let ranked = byWord.enumerated()
                .sorted { a, b in
                    if a.element.entries.count != b.element.entries.count {
                        return a.element.entries.count > b.element.entries.count
                    }
                    return a.offset < b.offset
                }
                .map(\.element)
            return byTitle + ranked
        }
    }

    public static func search(_ sets: [WordSet], _ query: String) -> [Hit] {
        Index(sets).search(query)
    }
}
