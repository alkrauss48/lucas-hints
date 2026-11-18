# [Lucas Hints](https://lucaskrauss.dev)

<p align="center">
<img src="LucasHints/Assets.xcassets/AppIcon.appiconset/lucas-hints.jpeg" width="80" height="80" style="max-width: 100%">
</p>

Welcome! Lucas Hints is an incredibly simple iOS app designed to provide you with a little bit of guidance when you need it - without telling you the whole story.

Wondering what to do next in your creative storytelling experience, or do you need a bit of advice with some real life decisions? Lucas Hints will help by giving you 3 unique icons across different categories. Want a fresh set? Just pull down to refresh - there's over 400,000 unique combinations of icons!

What do the icons actually mean? That's for you to interpret and decide! Now get out there and have some fun, and let your creativity flourish!

The app also includes an iMessage sticker pack.

## Requirements
- Xcode 15 or newer, with the iOS platform and a simulator runtime installed (Xcode > Settings > Components)
- iOS 17+ deployment target (iPhone and iPad)
- [SwiftLint](https://github.com/realm/SwiftLint) for linting (`brew install swiftlint`)

There are no environment variables or third-party dependencies.

## To Run
```sh
git clone https://github.com/alkrauss48/lucas-hints.git
cd lucas-hints
open LucasHints.xcodeproj
```

Select the `LucasHints` scheme and run it on an iOS Simulator or your own device. The `StickerPack` scheme runs the iMessage sticker pack.

To build from the command line:
```sh
xcodebuild -project LucasHints.xcodeproj -scheme LucasHints \
  -destination 'platform=iOS Simulator,name=iPhone 16' build
```

> If `xcodebuild` says it "requires Xcode", your active developer directory points at the Command Line Tools. Fix it with `sudo xcode-select -s /Applications/Xcode.app`, or prefix commands with `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer`.

## To Lint
This project uses SwiftLint with its default rules. CI runs it in strict mode on every push, so warnings fail the build:
```sh
# From the root of the project repo:
swiftlint --strict
```

## Testing
Tests are written with [XCTest](https://developer.apple.com/documentation/XCTest). CI builds the app and runs the unit tests on every push. Run them in Xcode (⌘U), or from the command line:
```sh
# Unit tests only
xcodebuild -project LucasHints.xcodeproj -scheme LucasHints \
  -destination 'platform=iOS Simulator,name=iPhone 16' \
  -only-testing:LucasHintsTests test

# Everything, including UI tests
xcodebuild -project LucasHints.xcodeproj -scheme LucasHints \
  -destination 'platform=iOS Simulator,name=iPhone 16' test
```

## Project Layout
```
LucasHints/
├── LucasHintsApp.swift          # App entry point
├── ContentView.swift            # Root view: glyph layout, pull-to-refresh, info button
├── Models/                      # Category, Glyph, UIGlyph
├── Seeders/CategorySeeder.swift # The full catalog of categories and their glyphs
├── State/AppState.swift         # Picks the 3 active glyphs
├── Views/                       # GlyphDetails (one tile), InfoSheet (about sheet)
└── Assets.xcassets/glyphs/      # SVG icons, one folder per category
LucasHintsTests/                 # Unit tests
LucasHintsUITests/               # UI tests
StickerPack/                     # iMessage sticker pack target
```

To add an icon, add its SVG imageset under `Assets.xcassets/glyphs/<category>/` and register it in `CategorySeeder.swift`. Asset names must be unique across all categories. If the counts change, update the combination count shown in `InfoSheet.swift` and in this README.

## AI-Assisted Development
This repo is set up for AI coding agents:
- [`CLAUDE.md`](CLAUDE.md) (also available as `AGENTS.md`) covers the architecture, commands, conventions, and gotchas that agents such as Claude Code read automatically.
- [`.claude/settings.json`](.claude/settings.json) pre-approves the read-only and build commands (lint, build, test, git inspection) shared by everyone working in the repo. Put personal overrides in `.claude/settings.local.json`, which is git-ignored.
