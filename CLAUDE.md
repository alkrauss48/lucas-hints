# CLAUDE.md

Guidance for AI coding agents (Claude Code, and others via `AGENTS.md`, which is a symlink to this file) working in this repo.

## What this is

Lucas Hints is a small SwiftUI iOS app (iOS 17+, iPhone and iPad) that shows 3 random icons ("glyphs"), each from a different category, to spark creative storytelling. Pull to refresh draws a new set. It also ships an iMessage sticker pack as a second target. There are no third-party dependencies, no networking, no persistence, and no environment variables.

## Commands

The machine's active developer directory may point at Command Line Tools instead of Xcode. If `xcodebuild` reports "requires Xcode", prefix commands with `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer`. Building also requires the iOS platform and a simulator runtime (Xcode > Settings > Components).

```sh
# Lint (CI runs this with --strict, so warnings fail the build)
swiftlint --strict

# Build the app
xcodebuild -project LucasHints.xcodeproj -scheme LucasHints \
  -destination 'platform=iOS Simulator,name=iPhone 16' build

# Run unit tests only (fast)
xcodebuild -project LucasHints.xcodeproj -scheme LucasHints \
  -destination 'platform=iOS Simulator,name=iPhone 16' \
  -only-testing:LucasHintsTests test

# Run one test
xcodebuild ... -only-testing:LucasHintsTests/LucasHintsTests/testAppStateRegenerate test

# List available simulators if the destination name doesn't exist
xcrun simctl list devices available
```

Schemes: `LucasHints` (app + unit and UI tests) and `StickerPack`.

## Architecture

The data flow runs in one direction and fits in a handful of files under `LucasHints/`:

- `Seeders/CategorySeeder.swift`: `seedCategories()` returns the hard-coded catalog: 13 `Category` values, each with a name, a pastel `Color` (hue `n / 13.0`), and a list of `Glyph`s.
- `Models/`: `Category`, `Glyph` (only an `assetName`), and `UIGlyph` (a glyph paired with its category). `UIGlyph` equality and hashing use **only** `glyph.assetName`.
- `State/AppState.swift`: an `ObservableObject` that holds `activeGlyphs`. `regenerateUiGlyphs()` picks 3 distinct categories, takes one random glyph from each, and retries until none of the new glyphs were in the previous set.
- `ContentView.swift`: the root view. It owns `AppState` via `@StateObject`, lays the glyphs out vertically or horizontally depending on orientation, provides pull to refresh, and has the info button.
- `Views/GlyphDetails.swift`: one glyph tile. `Views/InfoSheet.swift`: the about sheet's copy.

`StickerPack/` is a separate iMessage sticker target with its own PNG assets. It shares no code or assets with the app.

## Adding or changing glyphs

1. Add an SVG imageset at `LucasHints/Assets.xcassets/glyphs/<category>/<asset-name>.imageset/` (copy an existing imageset's `Contents.json` and change the filename).
2. Add `Glyph(assetName: "<asset-name>")` to the matching `seed<Category>()` function in `CategorySeeder.swift`.
3. Asset names must be **globally unique** across all categories. The `glyphs` folders don't provide a namespace, and `UIGlyph` equality depends on the name.
4. If the per-category glyph counts change, recompute the combination count and update both `Views/InfoSheet.swift` and `README.md`. The count is the sum, over every 3-category combination, of the product of their glyph counts. It is currently 435,000 (13 categories, 150 glyphs), shown as "over 400,000".

To check that every seeded name has an asset (and the reverse), compare `grep -o 'assetName: "[^"]*"' LucasHints/Seeders/CategorySeeder.swift` against `find LucasHints/Assets.xcassets/glyphs -name '*.imageset'`.

## Gotchas

- **New Swift files must be registered in `LucasHints.xcodeproj/project.pbxproj`.** This project uses classic groups (objectVersion 56), not folder-synchronized groups, so a file created on disk is not compiled until it's added to the target. Prefer adding files through Xcode. If you edit the pbxproj by hand, add matching `PBXFileReference`, `PBXBuildFile`, group child, and `PBXSourcesBuildPhase` entries with unique 24-character hex IDs. Files inside `.xcassets` do **not** need pbxproj changes.
- Don't hand-reformat `project.pbxproj`, `.xcscheme`, or `.plist` files.
- `AppState` is created per view via `@StateObject`. There is intentionally no singleton.
- The root-level `Stickers.xcstickers.xcstickers/` folder is an empty leftover that no target references. The real sticker assets live in `StickerPack/Stickers.xcassets`.

## Conventions

- Swift style is enforced by SwiftLint's default rules (there is no `.swiftlint.yml`). Lines are capped at 120 characters. Keep `--strict` clean.
- 4-space indentation, and keep the Xcode-style file header comment on new Swift files.
- Commit messages: `<type>: <summary>`, with the issue number when there is one, e.g. `feat: issue-1 - add new icon assets`. Types used: `feat`, `fix`, `refactor`, `chore`, `docs`, `test`, `ci`, `lint`, `release`.
- Releases: bump `MARKETING_VERSION` and `CURRENT_PROJECT_VERSION` in the pbxproj and commit as `release: vX.Y.Z+<build>` (e.g. `release: v1.0.1+7`).
- Work on a branch and open a PR against `main`.
