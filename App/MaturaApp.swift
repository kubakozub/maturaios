import SwiftUI
import MaturaCore

@main
struct MaturaApp: App {
    @StateObject private var app = AppState()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(app)
                .preferredColorScheme(.dark)
                // Gra jest w pionie: plansza ma kwadratowe proporcje, a pod nią
                // musi zmieścić się pełna klawiatura. W poziomie nie zostaje na
                // nią miejsca, więc obrót jest wyłączony w Info.plist.
                .statusBarHidden(true)
        }
    }
}

struct RootView: View {
    @EnvironmentObject var app: AppState

    var body: some View {
        Group {
            switch app.screen {
            case .start: StartView()
            case .menu: MenuView()
            case .setPick: SetPickView()
            case .modePick(let s): ModePickView(set: s)
            case .play(let s): PlayView(set: s)
            case .editor(let s): EditorView(editing: s)
            case .options: OptionsView()
            case .achievements: AchievementsView()
            case .scores: ScoresView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Palette.background)
        .ignoresSafeArea(.keyboard)
    }
}
