//
//  Glyph.swift
//  LucasHints
//
//  Created by Aaron Krauss on 8/1/24.
//

import SwiftUI

struct GlyphDetails: View {
    @Environment(\.colorScheme) var colorScheme

    var width: CGFloat
    var uiGlyph: UIGlyph

    var body: some View {
            ZStack {
                    Image(uiGlyph.glyph.assetName)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .frame(
                            width: width,
                            height: width,
                            alignment: .center
                        )
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
        width: 200,
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
