import SwiftUI
import MaturaCore

// MARK: - Start

struct StartView: View {
    @EnvironmentObject var app: AppState
    @State private var name: String = ""

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            PixelArt.image("logo_matura").resizable().scaledToFit().frame(height: 78)
            Spacer().frame(height: 8)
            Text(app.str.appTagline)
                .font(.system(size: 12, design: .monospaced))
                .foregroundStyle(Palette.muted)
            Spacer().frame(height: 38)

            VStack(alignment: .leading, spacing: 6) {
                Text(app.str.yourName)
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundStyle(Palette.muted)
                FieldInput(text: $name, placeholder: "Gracz")
            }
            Spacer().frame(height: 20)
            PrimaryButton(label: app.str.playAnonymously) { app.startPlaying(as: name) }
            Spacer().frame(height: 10)
            MenuButton(label: app.str.signIn, enabled: false, trailing: app.str.soon) {}
            Spacer().frame(height: 16)
            InfoCard(text: app.str.offlineNote)
            Spacer()
        }
        .padding(22)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Palette.background)
        .onAppear { name = app.profile.name }
    }
}

// MARK: - Menu

struct MenuView: View {
    @EnvironmentObject var app: AppState

    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 12)
            PixelArt.image("logo_matura").resizable().scaledToFit().frame(height: 58)
            Spacer().frame(height: 6)
            Text(app.profile.name)
                .font(.system(size: 12, design: .monospaced))
                .foregroundStyle(Palette.muted)
            Spacer().frame(height: 22)

            MenuButton(label: app.str.play, icon: "icon_target") { app.screen = .setPick }
            MenuButton(label: app.str.sets, icon: "mode_classic") { app.screen = .editor(nil) }
            MenuButton(label: app.str.options, icon: "icon_settings") { app.screen = .options }
            MenuButton(label: app.str.achievements, icon: "medal_gold") { app.screen = .achievements }
            MenuButton(label: app.str.scores, icon: "icon_trophy") { app.screen = .scores }
            Spacer()
        }
        .padding(18)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Palette.background)
    }
}

// MARK: - Wybór zestawu, z wyszukiwarką

struct SetPickView: View {
    @EnvironmentObject var app: AppState
    @State private var query = ""

    var body: some View {
        ScreenScaffold(title: app.str.chooseSet, backLabel: app.str.back,
                       onBack: { app.screen = .menu }) {
            let usable = app.allSets.filter(\.isPlayable)
            // Indeks liczony raz na listę, nie na każde naciśnięcie klawisza.
            let index = SetSearch.Index(usable)
            let hits = index.search(query)

            FieldInput(text: $query, placeholder: app.str.searchSets, fontSize: 12)

            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(hits) { hit in
                        MenuButton(
                            label: hit.set.title,
                            // Kiedy trafienie poszło po haśle, ważniejsze jest pokazanie
                            // KTÓRE hasło pasuje niż powtarzanie rozmiaru zestawu.
                            subtitle: subtitle(for: hit),
                            trailing: hit.set.builtIn ? app.str.builtIn : nil,
                            icon: "icon_star"
                        ) {
                            app.screen = .modePick(hit.set)
                        }
                    }
                    if usable.isEmpty {
                        InfoCard(text: app.str.needTwoEntries)
                    } else if hits.isEmpty {
                        InfoCard(text: app.str.nothingFound)
                    }
                }
            }
        }
    }

    private func subtitle(for hit: SetSearch.Hit) -> String {
        if !hit.entries.isEmpty {
            let show = hit.entries.prefix(3).map(\.term).joined(separator: ", ")
            let more = hit.entries.count > 3 ? ", …" : ""
            return "\(app.str.matchCount(hit.entries.count)): \(show)\(more)"
        }
        return "\(hit.set.entries.count) \(app.str.entriesLabel) · "
            + "\(hit.set.termLanguage) > \(hit.set.definitionLanguage)"
    }
}

struct ModePickView: View {
    @EnvironmentObject var app: AppState
    let set: WordSet

    var body: some View {
        ScreenScaffold(title: app.str.chooseMode, backLabel: app.str.back,
                       onBack: { app.screen = .setPick }) {
            Text(set.title)
                .font(.system(size: 13, weight: .bold, design: .monospaced))
                .foregroundStyle(Palette.bone)
            MenuButton(label: app.str.classic, subtitle: app.str.classicDesc,
                       icon: "mode_classic") {
                app.screen = .play(set)
            }
            MenuButton(label: "TRUE / FALSE", enabled: false, trailing: app.str.soon,
                       icon: "mode_truefalse") {}
            Spacer()
        }
    }
}

// MARK: - Opcje

struct OptionsView: View {
    @EnvironmentObject var app: AppState

    var body: some View {
        ScreenScaffold(title: app.str.options, backLabel: app.str.back,
                       onBack: { app.persist(); app.screen = .menu }) {
            ScrollView {
                VStack(spacing: 0) {
                    OptionRow(title: app.str.sound,
                              icon: app.options.soundEnabled ? "icon_sound_on" : "icon_sound_off") {
                        Toggle("", isOn: Binding(
                            get: { app.options.soundEnabled },
                            set: { app.options.soundEnabled = $0; app.persist() }
                        ))
                        .labelsHidden()
                        .tint(Palette.accent)
                    }

                    OptionRow(title: app.str.lives, icon: "heart") {
                        StepperControl(value: app.options.lives, range: 1...9) {
                            app.options.lives = $0; app.persist()
                        }
                    }

                    OptionRow(title: app.str.tempo, icon: "icon_clock") {
                        HStack(spacing: 5) {
                            ForEach(Tempo.allCases, id: \.self) { t in
                                ChoiceChip(label: t.label, selected: app.options.tempo == t) {
                                    app.options.tempo = t; app.persist()
                                }
                            }
                        }
                    }

                    OptionRow(title: app.str.texture, icon: "icon_palette") {
                        HStack(spacing: 5) {
                            ForEach(Texture.allCases, id: \.self) { t in
                                ChoiceChip(label: t.label, selected: app.options.texture == t) {
                                    app.options.texture = t; app.persist()
                                }
                            }
                        }
                    }

                    OptionRow(title: app.str.language, icon: "icon_globe") {
                        HStack(spacing: 5) {
                            ForEach(UiLanguage.allCases, id: \.self) { l in
                                ChoiceChip(label: l.rawValue.uppercased(),
                                           selected: app.options.uiLanguage == l) {
                                    app.options.uiLanguage = l; app.persist()
                                }
                            }
                        }
                    }

                    Spacer().frame(height: 10)
                    Text(app.str.direction)
                        .font(.system(size: 12, design: .monospaced))
                        .foregroundStyle(Palette.muted)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer().frame(height: 7)
                    ForEach([
                        (Direction.termToDef, app.str.dirTermToDef),
                        (Direction.defToTerm, app.str.dirDefToTerm),
                        (Direction.random, app.str.dirRandom),
                    ], id: \.0) { dir, label in
                        MenuButton(label: label,
                                   trailing: app.options.direction == dir ? "✓" : nil) {
                            app.options.direction = dir; app.persist()
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Osiągnięcia i wyniki

struct AchievementsView: View {
    @EnvironmentObject var app: AppState

    var body: some View {
        ScreenScaffold(title: app.str.achievements, backLabel: app.str.back,
                       onBack: { app.screen = .menu }) {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(Achievement.allCases) { a in
                        let got = a.unlocked(by: app.profile)
                        MenuButton(label: a.title(app.options.uiLanguage),
                                   subtitle: a.desc(app.options.uiLanguage),
                                   enabled: got,
                                   trailing: got ? nil : app.str.locked,
                                   icon: got ? a.iconAsset : "lock") {}
                    }
                }
            }
        }
    }
}

struct ScoresView: View {
    @EnvironmentObject var app: AppState

    var body: some View {
        ScreenScaffold(title: app.str.scores, backLabel: app.str.back,
                       onBack: { app.screen = .menu }) {
            if app.scores.isEmpty {
                InfoCard(text: app.str.noScores)
            } else {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(app.scores) { s in
                            MenuButton(
                                label: "\(s.score)  ·  \(s.setTitle)",
                                subtitle: "\(app.str.levelLabel) \(s.level) · "
                                    + "\(app.str.streakLabel) \(s.bestStreak) · "
                                    + "\(app.str.killsLabel) \(s.kills)",
                                icon: "icon_trophy"
                            ) {}
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Edytor zestawów

struct EditorView: View {
    @EnvironmentObject var app: AppState
    let editing: WordSet?

    @State private var title = ""
    @State private var rows: [Entry] = [Entry("", ""), Entry("", "")]
    @State private var armedForDelete: String? = nil

    var body: some View {
        ScreenScaffold(title: app.str.sets, backLabel: app.str.back,
                       onBack: { app.screen = .menu }) {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text(app.str.newSet)
                        .font(.system(size: 13, weight: .bold, design: .monospaced))
                        .foregroundStyle(Palette.bone)
                    FieldInput(text: $title, placeholder: app.str.setTitle)

                    ForEach(rows.indices, id: \.self) { i in
                        HStack(spacing: 8) {
                            Text("\(i + 1)")
                                .font(.system(size: 11, design: .monospaced))
                                .foregroundStyle(Palette.dim)
                                .frame(width: 20, alignment: .trailing)
                            FieldInput(text: Binding(
                                get: { rows[i].term },
                                set: { rows[i].term = $0 }
                            ), placeholder: "term", fontSize: 13)
                            FieldInput(text: Binding(
                                get: { rows[i].definition },
                                set: { rows[i].definition = $0 }
                            ), placeholder: "tłumaczenie", fontSize: 13)
                        }
                    }

                    MenuButton(label: app.str.addRow, icon: "icon_plus") {
                        rows.append(Entry("", ""))
                    }
                    PrimaryButton(label: app.str.save) { save() }

                    if !app.customSets.isEmpty {
                        Spacer().frame(height: 14)
                        Text(app.str.sets)
                            .font(.system(size: 13, weight: .bold, design: .monospaced))
                            .foregroundStyle(Palette.bone)
                        ForEach(app.customSets) { s in
                            HStack(spacing: 6) {
                                MenuButton(label: s.title,
                                           subtitle: "\(s.entries.count) \(app.str.entriesLabel)",
                                           icon: "icon_edit") {
                                    title = s.title
                                    rows = s.entries.isEmpty ? [Entry("", "")] : s.entries
                                }
                                // Pierwsze dotknięcie uzbraja, drugie kasuje —
                                // bez okienka, ale i bez przypadkowej utraty zestawu.
                                Button {
                                    if armedForDelete == s.id {
                                        app.delete(setId: s.id)
                                        armedForDelete = nil
                                    } else {
                                        armedForDelete = s.id
                                    }
                                } label: {
                                    PixelArt.image("icon_trash")
                                        .resizable().frame(width: 18, height: 18)
                                        .padding(10)
                                        .background(armedForDelete == s.id ? Palette.danger : Palette.surface)
                                        .overlay(Rectangle().stroke(Palette.surfaceHigh, lineWidth: 2))
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        if armedForDelete != nil {
                            Text(app.str.confirmDelete)
                                .font(.system(size: 11, design: .monospaced))
                                .foregroundStyle(Palette.danger)
                        }
                    }
                }
            }
        }
        .onAppear {
            if let editing {
                title = editing.title
                rows = editing.entries.isEmpty ? [Entry("", "")] : editing.entries
            }
        }
    }

    private func save() {
        let cleaned = rows.filter {
            !$0.term.trimmingCharacters(in: .whitespaces).isEmpty
                && !$0.definition.trimmingCharacters(in: .whitespaces).isEmpty
        }
        guard !cleaned.isEmpty else { return }
        let name = title.trimmingCharacters(in: .whitespaces)
        app.upsert(
            WordSet(id: editing?.id ?? UUID().uuidString,
                    title: name.isEmpty ? app.str.newSet : name,
                    entries: cleaned,
                    builtIn: false,
                    createdAt: Date().timeIntervalSince1970)
        )
        title = ""
        rows = [Entry("", ""), Entry("", "")]
    }
}
