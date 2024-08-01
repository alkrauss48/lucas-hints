//
//  Glyph.swift
//  LucasHints
//
//  Created by Aaron Krauss on 8/1/24.
//

import SwiftUI

struct GlyphDetails: View {
    @Environment(\.colorScheme) var colorScheme

    var uiGlyph: UIGlyph

    var body: some View {
            ZStack {
                Image(uiGlyph.glyph.assetName)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(width: 120, height: 120, alignment: .center)
            }
                .background(uiGlyph.category.color)
                .cornerRadius(20) /// make the background rounded
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 3)
                )
    }
}

#Preview {
    GlyphDetails(
        uiGlyph: UIGlyph(
            glyph:
                Glyph(assetName: "star"),
            category:
                Category(
                    name: "Weather",
                    color: Color(hue: 0.8, saturation: 0.15, brightness: 0.95),
                    glyphs: []
                )
        )
    )
}
