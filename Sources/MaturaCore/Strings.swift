import Foundation

/// Mała, dwujęzyczna tablica napisów. Dokument projektowy przewiduje w opcjach
/// „zmianę języka", a sama aplikacja jest dwujęzyczna PL/EN.
public struct Str: Sendable {
    public let lang: UiLanguage

    public init(_ lang: UiLanguage) { self.lang = lang }

    private func pick(_ pl: String, _ en: String) -> String { lang == .pl ? pl : en }

    public var appTagline: String { "Verbum + Game" }
    public var playAnonymously: String { pick("GRAJ ANONIMOWO", "PLAY ANONYMOUSLY") }
    public var signIn: String { pick("ZALOGUJ / ZAREJESTRUJ", "LOG IN / REGISTER") }
    public var offlineNote: String {
        pick("Logowanie wymaga serwera, którego ta wersja nie ma. Wszystko zapisuje się lokalnie na telefonie.",
             "Accounts need a server this build does not have. Everything is stored locally on the device.")
    }
    public var yourName: String { pick("Twoja nazwa", "Your name") }
    public var soon: String { pick("wkrótce", "soon") }

    public var play: String { pick("GRAJ", "PLAY") }
    public var sets: String { pick("ZESTAWY", "SETS") }
    public var options: String { pick("OPCJE", "OPTIONS") }
    public var achievements: String { pick("OSIĄGNIĘCIA", "ACHIEVEMENTS") }
    public var scores: String { pick("WYNIKI", "SCORES") }
    public var exit: String { pick("WYJŚCIE", "EXIT") }
    public var back: String { pick("< Wstecz", "< Back") }

    public var chooseSet: String { pick("Wybierz zestaw", "Choose a set") }
    public var chooseMode: String { pick("Wybierz tryb", "Choose a mode") }
    public var classic: String { "CLASSIC" }
    public var classicDesc: String {
        pick("Potworki idą do działka. Wpisz tłumaczenie, zanim dojdą.",
             "Monsters walk at the cannon. Type the translation before they arrive.")
    }

    public var builtIn: String { pick("wbudowany", "built-in") }
    public var entriesLabel: String { pick("haseł", "entries") }
    public var searchSets: String {
        pick("Szukaj: nazwa działu albo słówko", "Search: set name or a word")
    }
    public var nothingFound: String {
        pick("Nic nie pasuje. Spróbuj krótszego fragmentu: ogonki i wielkość liter nie mają znaczenia.",
             "Nothing matches. Try a shorter fragment: accents and letter case do not matter.")
    }
    public var needTwoEntries: String {
        pick("Zestaw musi mieć przynajmniej jedno wypełnione hasło z tłumaczeniem.",
             "A set needs at least one row with both sides filled in.")
    }

    /// Polski ma trzy formy liczby mnogiej, nie dwie: 1 hasło, 2 hasła, 5 haseł:
    /// i wyjątek na nastkach, przez który 12 to „haseł", a 22 znowu „hasła".
    public func matchCount(_ n: Int) -> String {
        if lang == .en { return n == 1 ? "1 matching entry" : "\(n) matching entries" }
        if n == 1 { return "1 pasujące hasło" }
        let last = n % 10, hundred = n % 100
        if (2...4).contains(last) && !(12...14).contains(hundred) {
            return "\(n) pasujące hasła"
        }
        return "\(n) pasujących haseł"
    }

    public var sound: String { pick("Dźwięk", "Sound") }
    public var lives: String { pick("Życia", "Lives") }
    public var tempo: String { pick("Tempo", "Pace") }
    public var texture: String { pick("Tekstury", "Textures") }
    public var language: String { pick("Język", "Language") }
    public var direction: String { pick("Kierunek tłumaczenia", "Translation direction") }
    public var dirTermToDef: String { pick("hasło → tłumaczenie", "term → definition") }
    public var dirDefToTerm: String { pick("tłumaczenie → hasło", "definition → term") }
    public var dirRandom: String { pick("losowo", "random") }

    public var newSet: String { pick("Nowy zestaw", "New set") }
    public var setTitle: String { pick("Nazwa zestawu", "Set title") }
    public var addRow: String { pick("Dodaj wiersz", "Add row") }
    public var save: String { pick("Zapisz", "Save") }
    public var deleteSet: String { pick("Usuń zestaw", "Delete set") }
    public var confirmDelete: String { pick("Na pewno? Dotknij jeszcze raz.", "Sure? Tap again.") }
    public var cannotDeleteBuiltIn: String {
        pick("Wbudowanych zestawów nie da się usunąć.", "Built-in sets cannot be removed.")
    }

    public var gameOver: String { pick("KONIEC GRY", "GAME OVER") }
    public var scoreLabel: String { pick("Punkty", "Score") }
    public var levelLabel: String { pick("Poziom", "Level") }
    public var streakLabel: String { pick("Najdłuższa seria", "Best streak") }
    public var killsLabel: String { pick("Zabici", "Kills") }
    public var again: String { pick("JESZCZE RAZ", "PLAY AGAIN") }
    public var toMenu: String { pick("DO MENU", "TO MENU") }
    public var noScores: String { pick("Brak wyników. Zagraj pierwszą grę.", "No scores yet. Play a game.") }
    public var locked: String { pick("zablokowane", "locked") }
}
