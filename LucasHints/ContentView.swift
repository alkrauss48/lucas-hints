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
    @State private var isShuffling = false
    @State private var flipAngle: Double = 0
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
                    Button(action: {
                        isPresentingInfo.toggle()
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                }
                .sheet(isPresented: $isPresentingInfo) {
                    InfoSheet(isPresented: $isPresentingInfo)
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
            // A perspective of 0 keeps the flip flat: the tile narrows to its center
            // line and back, without the near edge ballooning toward the viewer.
            .rotation3DEffect(.degrees(flipAngle), axis: (x: 0, y: 1, z: 0), perspective: 0)
            .opacity(tileOpacity)
    }

    /// Draws a new set of glyphs. The tiles flip edge-on, the glyphs are swapped
    /// while they're invisible, and then the tiles flip back into view. The button
    /// stays disabled until the animation finishes, so a new set can't be drawn
    /// in rapid succession.
    func shuffle() {
        guard !isShuffling else { return }
        isShuffling = true

        if reduceMotion {
            withAnimation(.easeIn(duration: 0.2)) {
                tileOpacity = 0
            } completion: {
                appState.regenerateUiGlyphs()
                withAnimation(.easeOut(duration: 0.2)) {
                    tileOpacity = 1
                } completion: {
                    isShuffling = false
                }
            }
            return
        }

        withAnimation(.easeIn(duration: 0.25)) {
            flipAngle = 90
        } completion: {
            // Swap the glyphs and jump to the opposite edge without animating,
            // so the flip keeps turning in the same direction.
            var transaction = Transaction()
            transaction.disablesAnimations = true
            withTransaction(transaction) {
                appState.regenerateUiGlyphs()
                flipAngle = -90
            }

            // Wait a run loop tick so the jump renders before the flip back starts.
            DispatchQueue.main.async {
                withAnimation(.easeOut(duration: 0.3)) {
                    flipAngle = 0
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
