import Foundation

/// Zapis stanu do jednego dokumentu JSON.
///
/// Cały stan: profil, opcje, zestawy i historia wyników: mieści się w jednym
/// pliku, bo przy tej skali baza danych byłaby narzutem bez zysku. Uszkodzony
/// albo niekompletny plik jest po cichu zastępowany stanem początkowym, żeby
/// aplikacja wstała zamiast się wywrócić.
///
/// Klasa nie zna SwiftUI: dostaje katalog z zewnątrz, więc daje się przetestować
/// na katalogu tymczasowym.
public final class Repository {

    public static let fileName = "matura.json"

    private let url: URL
    private let encoder: JSONEncoder = {
        let e = JSONEncoder()
        e.outputFormatting = [.prettyPrinted, .sortedKeys]
        return e
    }()
    private let decoder = JSONDecoder()

    public init(directory: URL) {
        self.url = directory.appendingPathComponent(Self.fileName)
    }

    /// Katalog dokumentów aplikacji: prywatny dla niej, kasowany razem z nią.
    public static func defaultDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }

    public func load() -> SaveData {
        guard let data = try? Data(contentsOf: url),
              let decoded = try? decoder.decode(SaveData.self, from: data)
        else {
            return SaveData()
        }
        return decoded
    }

    @discardableResult
    public func save(_ data: SaveData) -> Bool {
        guard let encoded = try? encoder.encode(data) else { return false }
        do {
            try encoded.write(to: url, options: .atomic)
            return true
        } catch {
            return false
        }
    }

    /// Wbudowane zestawy nie są zapisywane: zawsze biorą się z kodu, więc
    /// aktualizacja aplikacji przynosi nowe słownictwo bez migracji pliku.
    /// Na dysku leżą tylko zestawy gracza.
    public func allSets(custom: [WordSet]) -> [WordSet] {
        BuiltInSets.all() + custom
    }
}
