import SwiftUI
import MaturaCore

/// Wspólne klocki interfejsu. Wszystkie mają ostre krawędzie i grube obwódki,
/// żeby pasowały do pixel artu — SwiftUI domyślnie zaokrągla i wygładza.

struct ScreenScaffold<Content: View>: View {
    let title: String
    let backLabel: String
    let onBack: () -> Void
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(title.uppercased())
                    .font(.system(size: 17, weight: .heavy, design: .monospaced))
                    .foregroundStyle(Palette.bone)
                Spacer()
                Button(backLabel, action: onBack)
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundStyle(Palette.accent)
            }
            content()
        }
        .padding(18)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Palette.background)
    }
}

struct MenuButton: View {
    let label: String
    var subtitle: String? = nil
    var enabled: Bool = true
    var trailing: String? = nil
    var icon: String? = nil
    let action: () -> Void

    var body: some View {
        Button(action: { if enabled { action() } }) {
            HStack(spacing: 10) {
                if let icon { PixelArt.image(icon).resizable().frame(width: 22, height: 22) }
                VStack(alignment: .leading, spacing: 2) {
                    Text(label)
                        .font(.system(size: 15, weight: .bold, design: .monospaced))
                        .foregroundStyle(enabled ? Palette.bone : Palette.dim)
                        .multilineTextAlignment(.leading)
                    if let subtitle {
                        Text(subtitle)
                            .font(.system(size: 11, design: .monospaced))
                            .foregroundStyle(Palette.muted)
                            .multilineTextAlignment(.leading)
                    }
                }
                Spacer(minLength: 6)
                if let trailing {
                    Text(trailing)
                        .font(.system(size: 10, design: .monospaced))
                        .foregroundStyle(Palette.dim)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 11)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Palette.surface)
            .overlay(Rectangle().stroke(Palette.surfaceHigh, lineWidth: 2))
        }
        .buttonStyle(.plain)
        .padding(.bottom, 7)
    }
}

struct PrimaryButton: View {
    let label: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 15, weight: .heavy, design: .monospaced))
                .foregroundStyle(Palette.ink)
                .padding(.vertical, 13)
                .frame(maxWidth: .infinity)
                .background(Palette.accent)
        }
        .buttonStyle(.plain)
    }
}

struct ChoiceChip: View {
    let label: String
    let selected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 11, weight: .bold, design: .monospaced))
                .foregroundStyle(selected ? Palette.ink : Palette.muted)
                .padding(.horizontal, 9)
                .padding(.vertical, 6)
                .background(selected ? Palette.accent : Palette.surface)
                .overlay(Rectangle().stroke(Palette.surfaceHigh, lineWidth: 2))
        }
        .buttonStyle(.plain)
    }
}

struct OptionRow<Control: View>: View {
    let title: String
    var icon: String? = nil
    @ViewBuilder var control: () -> Control

    var body: some View {
        HStack(spacing: 10) {
            if let icon { PixelArt.image(icon).resizable().frame(width: 18, height: 18) }
            Text(title)
                .font(.system(size: 13, design: .monospaced))
                .foregroundStyle(Palette.bone)
            Spacer(minLength: 8)
            control()
        }
        .padding(.vertical, 9)
    }
}

struct StepperControl: View {
    let value: Int
    let range: ClosedRange<Int>
    let onChange: (Int) -> Void

    var body: some View {
        HStack(spacing: 10) {
            stepButton("-") { if value > range.lowerBound { onChange(value - 1) } }
            Text("\(value)")
                .font(.system(size: 14, weight: .bold, design: .monospaced))
                .foregroundStyle(Palette.bone)
                .frame(minWidth: 18)
            stepButton("+") { if value < range.upperBound { onChange(value + 1) } }
        }
    }

    private func stepButton(_ s: String, _ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(s)
                .font(.system(size: 15, weight: .heavy, design: .monospaced))
                .foregroundStyle(Palette.bone)
                .frame(width: 28, height: 28)
                .background(Palette.surface)
                .overlay(Rectangle().stroke(Palette.surfaceHigh, lineWidth: 2))
        }
        .buttonStyle(.plain)
    }
}

struct InfoCard: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 11.5, design: .monospaced))
            .foregroundStyle(Palette.muted)
            .lineSpacing(4)
            .padding(11)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Palette.surface)
            .overlay(Rectangle().stroke(Palette.surfaceHigh, lineWidth: 2))
    }
}

struct FieldInput: View {
    @Binding var text: String
    var placeholder: String = ""
    var fontSize: CGFloat = 14

    var body: some View {
        TextField("", text: $text, prompt: Text(placeholder).foregroundStyle(Palette.dim))
            .textFieldStyle(.plain)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .font(.system(size: fontSize, design: .monospaced))
            .foregroundStyle(Palette.bone)
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .background(Palette.ink)
            .overlay(Rectangle().stroke(Palette.surfaceHigh, lineWidth: 2))
    }
}
