import SwiftUI

/// Klawiatura narysowana w grze.
///
/// Celowo tylko A–Z, spacja, cofanie, strzałki i Enter — bez polskich znaków.
/// To nie niedoróbka, tylko założenie: gracz nie traci czasu na przełączanie
/// układu, a dopasowanie odpowiedzi i tak pomija ogonki, więc „zreczny" zalicza
/// się tak samo jak „zręczny".
///
/// Systemowa klawiatura iOS nie wchodzi w grę — zabrałaby połowę ekranu, którą
/// zajmuje plansza, i podpowiadałaby słowa, co zniszczyłoby sens ćwiczenia.
struct KeyboardView: View {
    let onKey: (Character) -> Void
    let onBackspace: () -> Void
    let onLeft: () -> Void
    let onRight: () -> Void
    let onEnter: () -> Void

    private let rows = ["QWERTYUIOP", "ASDFGHJKL", "ZXCVBNM"]

    var body: some View {
        VStack(spacing: 5) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 4) {
                    ForEach(Array(row), id: \.self) { ch in
                        key(String(ch)) { onKey(Character(ch.lowercased())) }
                    }
                }
            }
            HStack(spacing: 4) {
                key("◀", width: 44, action: onLeft)
                key("▶", width: 44, action: onRight)
                key("␣", width: 96) { onKey(" ") }
                key("⌫", width: 52, action: onBackspace)
                key("⏎", width: 60, tint: Palette.accent, action: onEnter)
            }
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(Palette.surface)
    }

    private func key(_ label: String, width: CGFloat? = nil,
                     tint: Color? = nil, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 15, weight: .bold, design: .monospaced))
                .foregroundStyle(tint == nil ? Palette.bone : Palette.ink)
                .frame(width: width, height: 38)
                .frame(maxWidth: width == nil ? .infinity : nil)
                .background(tint ?? Palette.background)
                .overlay(Rectangle().stroke(Palette.surfaceHigh, lineWidth: 2))
        }
        .buttonStyle(.plain)
    }
}
