//
//  ContentView.swift
//  LucasHints
//
//  Created by Aaron Krauss on 7/28/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appState = AppState()
    @State private var isPresentingInfo = false

    var body: some View {
        GeometryReader { metrics in
            NavigationView {
                ScrollView {
                    ZStack {
                        Spacer().containerRelativeFrame([.horizontal, .vertical])
                            if metrics.size.width < metrics.size.height {
                                verticalDisplay(width: metrics.size.width)
                            } else {
                                horizontalDisplay(width: metrics.size.height)
                            }
                        }
                    .frame(maxWidth: .infinity)
                }.refreshable {
                    appState.regenerateUiGlyphs()
                }.toolbar {
                    Button(action: {
                        isPresentingInfo.toggle()
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                }.sheet(isPresented: $isPresentingInfo) {
                    InfoSheet(isPresented: $isPresentingInfo)
                }
            }
        }
    }

    func verticalDisplay(width: CGFloat) -> some View {
        VStack {
            ForEach(appState.activeGlyphs, id: \.self.glyph.assetName) { uiGlyph in
                GlyphDetails(width: width * 0.3, uiGlyph: uiGlyph)
                    .padding(
                        EdgeInsets(
                            top: 0,
                            leading: 0,
                            bottom: 30,
                            trailing: 0
                        )
                    )
            }
        }
    }

    func horizontalDisplay(width: CGFloat) -> some View {
        HStack {
            ForEach(appState.activeGlyphs, id: \.self.glyph.assetName) { uiGlyph in
                GlyphDetails(width: width * 0.3, uiGlyph: uiGlyph)
                    .padding(
                        EdgeInsets(
                            top: 0,
                            leading: 0,
                            bottom: 0,
                            trailing: uiGlyph == appState.activeGlyphs.last ? 0 : 30
                        )
                    )
            }
        }
    }
}

#Preview {
    ContentView()
}
