//
//  AppState.swift
//  LucasHints
//
//  Created by Aaron Krauss on 8/1/24.
//

import Foundation

class AppState: ObservableObject {
    var categories: [Category]
    @Published var activeGlyphs: [UIGlyph] = []

    init() {
        self.categories = seedCategories()

        regenerateUiGlyphs()
    }

    func regenerateUiGlyphs() {
        // Create a set of the original active glyph asset names.
        let oldGlyphAssetNames = Set(self.activeGlyphs.map { $0.glyph.assetName })

        // Generate new active glyphs.
        self.activeGlyphs = categories
            .shuffled()
            .prefix(3)
            .map { UIGlyph(glyph: $0.glyphs.randomElement()!, category: $0)}

        // Verify that the new glyphs are all different than the original ones.
        let notAllNewGlyphs = Set(self.activeGlyphs.map { $0.glyph.assetName })
            .intersection(oldGlyphAssetNames)
            .count > 0

        // If there is any overlap in old-to-new glyphs,
        // then regenerate the glyphs again.
        if notAllNewGlyphs {
            regenerateUiGlyphs()
        }
    }
}
