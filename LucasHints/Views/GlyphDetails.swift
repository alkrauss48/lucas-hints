//
//  Glyph.swift
//  LucasHints
//
//  Created by Aaron Krauss on 8/1/24.
//

import SwiftUI

struct GlyphDetails: View {
    var uiGlyph: UIGlyph

    var body: some View {
        VStack {
            HStack {
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
                        .stroke(.black, lineWidth: 3)
                )
        }
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
                    color: Color(hue: 0.1, saturation: 0.1, brightness: 0.95),
                    glyphs: []
                )
        )
    )
}
