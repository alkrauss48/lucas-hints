//
//  AppState.swift
//  LucasHints
//
//  Created by Aaron Krauss on 8/1/24.
//

import Foundation

class AppState: ObservableObject
{
    var categories: [Category]
    @Published var activeGlyphs: [UIGlyph] = []

    init() {
        self.categories = seedCategories()
        regenerateUiGlyphs()
    }

    func regenerateUiGlyphs() {
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
