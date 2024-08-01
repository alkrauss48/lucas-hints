//
//  ContentView.swift
//  LucasHints
//
//  Created by Aaron Krauss on 7/28/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appState = getAppState()
    @State private var isPresentingInfo: Bool = false

    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Spacer().containerRelativeFrame([.horizontal, .vertical])
                    VStack {
                        ForEach(appState.activeGlyphs, id: \.self.glyph.assetName) { uiGlyph in
                            GlyphDetails(uiGlyph: uiGlyph)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                        }
                    }
                }
            }.refreshable {
                appState.regenerateUiGlyphs()
            }.toolbar {
                Button(action: {
                    isPresentingInfo.toggle()
               }) {
                   Image(systemName: "info.circle")
               }
            }.sheet(isPresented: $isPresentingInfo) {
                InfoSheet()
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    ContentView()
}
