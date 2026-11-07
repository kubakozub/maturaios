import SwiftUI
import UIKit

/// Paleta wzięta wprost z pakietu grafiki, żeby interfejs i plansza nie
/// rozjeżdżały się kolorystycznie.
enum Palette {
    static let background = Color(hex: 0x12162A)
    static let ink = Color(hex: 0x0B0E1C)
    static let surface = Color(hex: 0x1A1E30)
    static let surfaceHigh = Color(hex: 0x2B2F4A)
    static let bone = Color(hex: 0xE8E4D4)
    static let muted = Color(hex: 0x8F8A76)
    static let dim = Color(hex: 0x5A5668)
    static let accent = Color(hex: 0xE2B04A)
    static let danger = Color(hex: 0xC4453C)
    static let good = Color(hex: 0x6FA84B)
}

extension Color {
    init(hex: UInt32) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: 1
        )
    }
}

/// Ładowanie i cięcie grafiki pikselowej.
///
/// Grafika jest w natywnej rozdzielczości i **nigdy** nie może być wygładzana:
/// dwuliniowe skalowanie zamienia pixel art w rozmytą papkę. Stąd wszędzie
/// `.interpolation(.none)`, a przy kaflach całkowity krok, żeby na styku nie
/// pojawiały się szczeliny.
enum PixelArt {

    private static var cache: [String: Image] = [:]
    private static let lock = NSLock()

    static func image(_ name: String) -> Image {
        lock.lock(); defer { lock.unlock() }
        if let c = cache[name] { return c }
        let img = Image(name).interpolation(.none).antialiased(false)
        cache[name] = img
        return img
    }

    /// Kafel tła powielany w obu osiach. Krok jest całkowity, bo ułamkowy
    /// zostawia widoczne szpary między kaflami.
    static func tiled(_ name: String, size: CGSize, tile: CGFloat = 32) -> some View {
        let step = max(1, tile.rounded())
        let cols = Int((size.width / step).rounded(.up)) + 1
        let rows = Int((size.height / step).rounded(.up)) + 1
        return Canvas { ctx, _ in
            let resolved = ctx.resolve(image(name))
            for r in 0..<rows {
                for c in 0..<cols {
                    ctx.draw(resolved,
                             in: CGRect(x: CGFloat(c) * step, y: CGFloat(r) * step,
                                        width: step, height: step))
                }
            }
        }
        .frame(width: size.width, height: size.height)
        .clipped()
    }
}

/// Który sprite dostaje potworek na danym poziomie.
///
/// Poziom brany jest z chwili pojawienia się, nie bieżący: inaczej potworek
/// zmieniałby wygląd w trakcie marszu, gdy gracz akurat awansuje.
enum MonsterArt {
    private static let tiers = [
        "slime", "slime_purple", "slime_red", "bat", "spider", "ghost", "brute", "boss",
    ]

    static func tier(level: Int, variant: Int) -> String {
        let base = min(tiers.count - 1, (level - 1) / 2)
        // Wariant miesza w obrębie sąsiednich poziomów, żeby fala nie wyglądała
        // jak kopia tego samego stwora.
        let idx = min(tiers.count - 1, max(0, base + (variant % 2)))
        return tiers[idx]
    }

    /// Dwuklatkowy cykl chodu: klatka bazowa i `_f2` na zmianę co ~200 ms.
    static func frame(level: Int, variant: Int, elapsed: Double, phase: Double) -> String {
        let t = tier(level: level, variant: variant)
        let alt = Int(((elapsed + phase) / GameEngineWalkFrameTime).rounded(.down)) % 2 == 1
        return alt ? "\(t)_f2" : t
    }

    static func death(level: Int, variant: Int) -> String {
        "\(tier(level: level, variant: variant))_death"
    }

    static func armor(level: Int, variant: Int) -> String {
        "armor_\(tier(level: level, variant: variant))"
    }
}

/// Powtórzone tu, żeby warstwa rysująca nie musiała importować całego silnika
/// tylko po jedną stałą animacji.
let GameEngineWalkFrameTime: Double = 0.2
