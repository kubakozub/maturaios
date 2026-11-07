# Matura: iOS

A game for learning the English vocabulary covered by the Polish *matura* school leaving
exam at basic level. A port of the Android version: **the same engine, the same
vocabulary, the same mechanics**, rewritten from scratch in Swift and SwiftUI.

**Version 0.8.0** (build 9) · 102 sets · 2084 entries · 14 topic areas of the basic exam

- Android version: **[github.com/kubakozub/Matura](https://github.com/kubakozub/Matura)**
- Browser demo: **[kubakozub.github.io/Matura](https://kubakozub.github.io/Matura)**

## How it plays

A cannon stands in the middle of the board. Monsters come in from both sides, each with an
English word above its head. You type the Polish translation: the cannon turns and fires.
A monster that reaches the cannon costs a life.

Typing matches on a prefix, so `cie` highlights both `ciekawość` and `cierpki`. Enter
fires when the text is an exact match, and when several entries match, the nearest monster
is the one that dies.

## Project layout

```
Package.swift              the SPM package holding MaturaCore
Sources/MaturaCore/        all the mechanics, with no SwiftUI and no UIKit
  Models.swift             sets, entries, options, profile, scores, badges
  Matching.swift           answer normalisation and matching
  GameEngine.swift         the CLASSIC mode simulation
  SetSearch.swift          searching sets by name and by entry
  BuiltInSets.swift        generated vocabulary, not to be edited by hand
  Strings.swift            Polish and English interface text
  Repository.swift         state persistence to JSON
Tests/MaturaCoreTests/     58 tests, the same ones as on the Android side
App/                       the SwiftUI layer
  MaturaApp.swift          entry point and screen stack
  AppState.swift           application state, load and save
  PixelArt.swift           asset loading, tiles, sprite selection
  Views/                   screens, board, keyboard
  Assets.xcassets          97 images at native resolution
Matura.xcodeproj           the Xcode project
```

**`MaturaCore` deliberately knows nothing about SwiftUI or UIKit.** That is what lets the
whole game mechanic compile and be tested without a simulator, including on Linux with a
plain `swift test`. It is the same decision as on the Android side, where the engine is
pure Kotlin with no Android types, and it is made for the same reason: tests that require
an emulator get run rarely, and so they stop protecting anything.

## Building

The iOS app needs **macOS and Xcode 15**. There is no way around that, and it is Apple's
constraint rather than this project's.

```bash
open Matura.xcodeproj          # target "Matura", any iPhone simulator
```

The engine on its own builds and tests **on any system with Swift**, Linux included:

```bash
swift build
swift test                     # 58 tests
```

That is exactly how this port is verified: the engine passes the full test suite off
macOS, and the SwiftUI layer has been checked syntactically (`swiftc -parse`).
**It has not yet been run on a simulator**, which is the first thing to do when it is next
opened on a Mac.

## What is ported and what is not

| Item | State |
|---|---|
| The CLASSIC engine with full difficulty progression | yes, identical |
| Answer matching that ignores Polish diacritics | yes, identical |
| Searching sets by name and by entry | yes |
| Game pace CALM / NORM / FAST | yes |
| 102 sets, 2084 entries | yes, generated from the same source |
| Custom sets, the editor, deletion | yes |
| Achievements and a local leaderboard | yes |
| An A-Z keyboard drawn inside the game | yes |
| Pixel art with no smoothing | yes |
| **Bitmap font** | **no**, text uses the system monospaced face |
| Sound | no, the option exists but nothing plays yet |

The bitmap font is the one deliberate difference from Android. Rendering a custom glyph
sheet in SwiftUI means slicing the image through CoreGraphics and doing your own text
layout, and before a first run on real hardware there was no way to check it. A first
version that looks slightly different is better than one whose text is a few pixels out of
place.

## Game pace

The gap between waves is **6.5 s** on the first level, shortening by 0.14 s per level down
to 2.6 s. Those numbers are not arbitrary: the average answer in these sets is eight
letters, and at three letters per second on an on-screen keyboard plus a moment to recall
the word, one monster occupies a player for roughly four seconds. An earlier version
released them every 3.4 s, which is faster than they could be cleared, and that was true
from the first level.

The **Pace** option stretches those gaps by 35% (CALM) or compresses them by 25% (FAST),
because the difference between someone typing two letters per second and four is a factor
of two, and no single setting fits everyone.

## Privacy

The app has no network access, collects no data and has no sign-in. Everything lives in
the app's private directory and goes away with it.

## License

Code: for the author's own use. The artwork comes from a purchased pixel art pack and is
not covered by a redistribution licence.
