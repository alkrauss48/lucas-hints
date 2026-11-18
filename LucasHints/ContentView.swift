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
    @State private var isPresentingAllGlyphs = false
    @State private var isShuffling = false
    @State private var slideOffset: CGFloat = 0
    @State private var tileOpacity: Double = 1
    @Environment(\.accessibilityReduceMotion) var reduceMotion

    var body: some View {
        GeometryReader { metrics in
            NavigationStack {
                VStack(spacing: 0) {
                    Spacer()
                    if metrics.size.width < metrics.size.height {
                        verticalDisplay(width: metrics.size.width)
                    } else {
                        horizontalDisplay(width: metrics.size.height)
                    }
                    Spacer()
                    shuffleButton
                }
                .frame(maxWidth: .infinity)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            isPresentingAllGlyphs.toggle()
                        }, label: {
                            Image(systemName: "square.grid.3x3")
                        })
                        .accessibilityLabel("All icons")
                        .accessibilityIdentifier("allIconsButton")

                        Button(action: {
                            isPresentingInfo.toggle()
                        }, label: {
                            Image(systemName: "info.circle")
                        })
                    }
                }
                .sheet(isPresented: $isPresentingInfo) {
                    InfoSheet(isPresented: $isPresentingInfo)
                }
                .sheet(isPresented: $isPresentingAllGlyphs) {
                    AllGlyphsSheet(isPresented: $isPresentingAllGlyphs, categories: appState.categories)
                }
            }
        }
        .sensoryFeedback(.impact(weight: .light), trigger: appState.activeGlyphs)
    }

    var shuffleButton: some View {
        Button(action: shuffle) {
            Label("New Hints", systemImage: "shuffle")
                .font(.headline)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .disabled(isShuffling)
        .padding(.bottom)
        .accessibilityIdentifier("newHintsButton")
    }

    func verticalDisplay(width: CGFloat) -> some View {
        VStack {
            ForEach(appState.activeGlyphs, id: \.self.glyph.assetName) { uiGlyph in
                tile(uiGlyph, width: width)
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
                tile(uiGlyph, width: width)
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

    func tile(_ uiGlyph: UIGlyph, width: CGFloat) -> some View {
        GlyphDetails(width: width * 0.3, uiGlyph: uiGlyph)
            .offset(x: slideOffset)
            .opacity(tileOpacity)
    }

    /// Draws a new set of glyphs. The current tiles drift a little to the left
    /// while fading out, the glyphs are swapped while they're invisible, and the
    /// new tiles drift in from a little to the right while fading in. The button
    /// stays disabled until the animation finishes, so a new set can't be drawn
    /// in rapid succession. With Reduce Motion on, the tiles only fade.
    func shuffle() {
        guard !isShuffling else { return }
        isShuffling = true

        let distance: CGFloat = reduceMotion ? 0 : 24

        withAnimation(.easeIn(duration: 0.2)) {
            slideOffset = -distance
            tileOpacity = 0
        } completion: {
            // Swap the glyphs and move them to the right side without animating.
            var transaction = Transaction()
            transaction.disablesAnimations = true
            withTransaction(transaction) {
                appState.regenerateUiGlyphs()
                slideOffset = distance
            }

            // Wait a run loop tick so the jump renders before the slide in starts.
            DispatchQueue.main.async {
                withAnimation(.easeOut(duration: 0.25)) {
                    slideOffset = 0
                    tileOpacity = 1
                } completion: {
                    isShuffling = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
