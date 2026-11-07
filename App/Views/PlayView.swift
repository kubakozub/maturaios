import SwiftUI
import MaturaCore

/// Plansza i pętla klatek.
///
/// Silnik pracuje w kwadracie jednostkowym, więc tu dzieje się tylko przeliczenie
/// na piksele i rysowanie. Dzięki temu cała mechanika jest przetestowana bez
/// symulatora, a ten plik nie ma żadnej logiki gry poza obsługą klawiszy.
struct PlayView: View {
    @EnvironmentObject var app: AppState
    let set: WordSet

    @StateObject private var host = EngineHost()
    @State private var lastTick: Date = .now

    var body: some View {
        VStack(spacing: 0) {
            hud
            board
            KeyboardView(
                onKey: { host.engine.type($0) },
                onBackspace: { host.engine.backspace() },
                onLeft: { host.engine.cursorLeft() },
                onRight: { host.engine.cursorRight() },
                onEnter: { host.engine.submit(); host.bump() }
            )
        }
        .background(Palette.background)
        .onAppear { host.start(set: set, options: app.options) }
        .overlay { if host.engine.gameOver { gameOverPanel } }
        .onReceive(Timer.publish(every: 1.0 / 60.0, on: .main, in: .common).autoconnect()) { now in
            let dt = min(0.05, now.timeIntervalSince(lastTick))
            lastTick = now
            guard !host.engine.gameOver else { return }
            host.engine.tick(dt)
            host.bump()
        }
    }

    // MARK: - Górny pasek

    private var hud: some View {
        HStack(spacing: 12) {
            HStack(spacing: 3) {
                ForEach(0..<host.engine.maxLives, id: \.self) { i in
                    PixelArt.image(i < host.engine.lives ? "heart" : "heart_empty")
                        .resizable().frame(width: 14, height: 14)
                }
            }
            Text("∞ / \(host.engine.heavyAmmo)")
                .font(.system(size: 12, design: .monospaced))
                .foregroundStyle(Palette.muted)
            Spacer()
            if host.engine.multiplier > 1 {
                Text("x\(host.engine.multiplier)")
                    .font(.system(size: 13, weight: .heavy, design: .monospaced))
                    .foregroundStyle(Palette.accent)
            }
            Button(app.str.toMenu) { app.screen = .menu }
                .font(.system(size: 11, weight: .bold, design: .monospaced))
                .foregroundStyle(Palette.accent)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Palette.surface)
    }

    // MARK: - Plansza

    private var board: some View {
        GeometryReader { geo in
            let w = geo.size.width, h = geo.size.height
            ZStack {
                PixelArt.tiled(app.options.texture.tileAsset, size: geo.size)

                Canvas { ctx, size in
                    let e = host.engine
                    let highlighted = e.highlightedIds()
                    let px = { (x: Double) in CGFloat(x) * size.width }
                    let py = { (y: Double) in CGFloat(y) * size.height }
                    let sprite = min(size.width, size.height) * 0.11

                    for c in e.corpses {
                        draw(ctx, MonsterArt.death(level: c.spawnLevel, variant: c.variant),
                             px(c.x), py(c.y), sprite)
                    }

                    for crate in e.crates {
                        draw(ctx, "crate", px(crate.x), py(crate.y), sprite * 0.8)
                        label(ctx, crate.prompt, px(crate.x), py(crate.y) - sprite * 0.65,
                              color: Palette.good)
                    }

                    // Działko: lufa celuje w potworka, do którego gracz właśnie pisze.
                    let aim = e.monsters.first { highlighted.contains($0.id) }
                    let angle = aim.map {
                        atan2(py($0.y) - py(GameEngine.cannonY), px($0.x) - px(GameEngine.cannonX))
                    } ?? -Double.pi / 2
                    var cannon = ctx
                    cannon.translateBy(x: px(GameEngine.cannonX), y: py(GameEngine.cannonY))
                    cannon.rotate(by: .radians(angle + .pi / 2))
                    cannon.draw(cannon.resolve(PixelArt.image("cannon")),
                                in: CGRect(x: -sprite / 2, y: -sprite / 2,
                                           width: sprite, height: sprite))

                    for m in e.monsters {
                        let name = MonsterArt.frame(level: m.spawnLevel, variant: m.variant,
                                                    elapsed: e.elapsed, phase: Double(m.id) * 0.07)
                        draw(ctx, name, px(m.x), py(m.y), sprite,
                             flash: m.hitFlash > 0)
                        if m.armored {
                            draw(ctx, MonsterArt.armor(level: m.spawnLevel, variant: m.variant),
                                 px(m.x), py(m.y), sprite)
                        }
                        label(ctx, m.prompt, px(m.x), py(m.y) - sprite * 0.72,
                              color: highlighted.contains(m.id) ? Palette.accent : Palette.bone)
                    }

                    for p in e.projectiles {
                        draw(ctx, p.heavy ? "bullet_heavy" : "bullet",
                             px(p.x), py(p.y), sprite * 0.35)
                    }
                }

                if host.engine.levelUpBanner > 0 {
                    Text("\(app.str.levelLabel) \(host.engine.level)")
                        .font(.system(size: 22, weight: .heavy, design: .monospaced))
                        .foregroundStyle(Palette.accent)
                }
            }
            .frame(width: w, height: h)
            .clipped()
            .overlay(alignment: .bottomLeading) { corner("\(host.engine.score)") }
            .overlay(alignment: .bottomTrailing) {
                corner("\(app.str.levelLabel) \(host.engine.level)")
            }
            .overlay(alignment: .top) { typedStrip }
        }
    }

    private var typedStrip: some View {
        Text(host.engine.typed.isEmpty ? " " : host.engine.typed)
            .font(.system(size: 18, weight: .bold, design: .monospaced))
            .foregroundStyle(Palette.bone)
            .padding(.horizontal, 12).padding(.vertical, 6)
            .background(Palette.ink.opacity(0.75))
            .padding(.top, 8)
    }

    private func corner(_ s: String) -> some View {
        Text(s)
            .font(.system(size: 12, weight: .bold, design: .monospaced))
            .foregroundStyle(Palette.bone)
            .padding(6)
            .background(Palette.ink.opacity(0.6))
            .padding(6)
    }

    private func draw(_ ctx: GraphicsContext, _ name: String,
                      _ x: CGFloat, _ y: CGFloat, _ size: CGFloat, flash: Bool = false) {
        var c = ctx
        if flash { c.addFilter(.colorMultiply(.white)) }
        c.draw(c.resolve(PixelArt.image(name)),
               in: CGRect(x: x - size / 2, y: y - size / 2, width: size, height: size))
    }

    private func label(_ ctx: GraphicsContext, _ text: String,
                       _ x: CGFloat, _ y: CGFloat, color: Color) {
        var resolved = ctx.resolve(
            Text(text).font(.system(size: 11, weight: .bold, design: .monospaced))
                .foregroundColor(color)
        )
        resolved.shading = .color(color)
        let s = resolved.measure(in: CGSize(width: 220, height: 40))
        ctx.draw(resolved, in: CGRect(x: x - s.width / 2, y: y - s.height / 2,
                                      width: s.width, height: s.height))
    }

    // MARK: - Koniec gry

    private var gameOverPanel: some View {
        VStack(spacing: 12) {
            Text(app.str.gameOver)
                .font(.system(size: 24, weight: .heavy, design: .monospaced))
                .foregroundStyle(Palette.danger)
            VStack(alignment: .leading, spacing: 5) {
                row(app.str.scoreLabel, "\(host.engine.score)")
                row(app.str.levelLabel, "\(host.engine.level)")
                row(app.str.streakLabel, "\(host.engine.bestStreak)")
                row(app.str.killsLabel, "\(host.engine.kills)")
            }
            PrimaryButton(label: app.str.again) { host.start(set: set, options: app.options) }
            MenuButton(label: app.str.toMenu) { app.screen = .menu }
        }
        .padding(22)
        .background(Palette.surface)
        .overlay(Rectangle().stroke(Palette.surfaceHigh, lineWidth: 3))
        .padding(28)
        .onAppear {
            app.finish(set: set, score: host.engine.score, level: host.engine.level,
                       bestStreak: host.engine.bestStreak, kills: host.engine.kills)
        }
    }

    private func row(_ k: String, _ v: String) -> some View {
        HStack {
            Text(k).foregroundStyle(Palette.muted)
            Spacer()
            Text(v).foregroundStyle(Palette.bone)
        }
        .font(.system(size: 13, design: .monospaced))
        .frame(width: 200)
    }
}

/// Silnik jest klasą referencyjną, a SwiftUI odświeża się po zmianie
/// `@Published`. Zamiast rozgłaszać cały stan co klatkę, podbijamy licznik:
/// jeden sygnał na klatkę zamiast kilkunastu.
@MainActor
final class EngineHost: ObservableObject {
    @Published private(set) var frame: Int = 0
    private(set) var engine: GameEngine = GameEngine(set: WordSet(id: "", title: ""))

    func start(set: WordSet, options: Options) {
        engine = GameEngine(
            set: set,
            config: GameConfig(lives: options.lives, direction: options.direction,
                               tempo: options.tempo),
            seed: UInt64(UInt32.random(in: 1...UInt32.max))
        )
        frame = 0
    }

    func bump() { frame &+= 1 }
}
