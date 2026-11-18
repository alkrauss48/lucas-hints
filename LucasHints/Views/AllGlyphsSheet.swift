//
//  AllGlyphsSheet.swift
//  LucasHints
//
//  Created by Aaron Krauss on 11/18/26.
//

import SwiftUI

/// Shows every glyph in the catalog as a small thumbnail, grouped and
/// color-coded by category, so anyone can quickly scan all of the icons.
struct AllGlyphsSheet: View {
    @Binding var isPresented: Bool
    var categories: [Category]

    private var glyphCount: Int {
        categories.reduce(0) { $0 + $1.glyphs.count }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    Text("\(glyphCount) icons across \(categories.count) categories")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    ForEach(categories, id: \.name) { category in
                        CategorySection(category: category)
                    }
                }
                .padding()
            }
            .navigationTitle("All Icons")
            .toolbar {
                Button(action: {
                    isPresented = false
                }, label: {
                    Text("Close")
                })
            }
        }
    }
}

private struct CategorySection: View {
    var category: Category

    // Every category has a multiple of 5 glyphs, so 5 columns fill each row.
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 5)

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Styled like a standard iOS grouped list section header.
            HStack {
                Text(category.name)
                Spacer()
                Text("\(category.glyphs.count)")
            }
            .font(.footnote)
            .textCase(.uppercase)
            .foregroundStyle(.secondary)
            .padding(.horizontal, 4)
            .accessibilityElement(children: .combine)
            .accessibilityAddTraits(.isHeader)

            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(category.glyphs, id: \.assetName) { glyph in
                    GlyphThumbnail(glyph: glyph, color: category.color)
                }
            }
        }
    }
}

private struct GlyphThumbnail: View {
    @Environment(\.colorScheme) var colorScheme

    var glyph: Glyph
    var color: Color

    var body: some View {
        // A square box sized by the grid column, with the icon fit inside it,
        // so every tile is the same size whatever the icon's aspect ratio.
        color
            .aspectRatio(1, contentMode: .fit)
            .overlay(
                Image(glyph.assetName)
                    .resizable()
                    .scaledToFit()
                    .padding(6)
            )
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 1)
            )
            .accessibilityLabel(glyph.assetName)
    }
}

#Preview {
    AllGlyphsSheet(isPresented: .constant(true), categories: seedCategories())
}
