//
//  ContentView.swift
//  LucasHints
//
//  Created by Aaron Krauss on 7/28/24.
//

import SwiftUI

struct ContentView: View {
    var appState = getAppState()

    var body: some View {
        VStack {
            ForEach(appState.activeGlyphs, id: \.self.glyph.assetName) { uiGlyph in
                GlyphDetails(uiGlyph: uiGlyph)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
