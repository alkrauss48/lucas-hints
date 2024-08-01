//
//  AppState.swift
//  LucasHints
//
//  Created by Aaron Krauss on 8/1/24.
//

import Foundation

struct AppState
{
    var categories: [Category]
    var activeGlyphs: [UIGlyph] = []

    init() {
        self.categories = seedCategories()
        regenerateUiGlyphs()
    }

    mutating func regenerateUiGlyphs() {
        self.activeGlyphs = categories
            .shuffled()
            .prefix(3)
            .map { UIGlyph(glyph: $0.glyphs.randomElement()!, category: $0)}
    }
}

var appState = AppState()

func getAppState() -> AppState {
    return appState
}
