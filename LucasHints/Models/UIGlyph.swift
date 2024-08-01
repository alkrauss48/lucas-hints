//
//  UIGlyph.swift
//  LucasHints
//
//  Created by Aaron Krauss on 8/1/24.
//

import Foundation
import SwiftUI

struct UIGlyph: Hashable {
    static func == (lhs: UIGlyph, rhs: UIGlyph) -> Bool {
        lhs.glyph.assetName == rhs.glyph.assetName
    }

    static func != (lhs: UIGlyph, rhs: UIGlyph) -> Bool {
        lhs.glyph.assetName != rhs.glyph.assetName
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(glyph.assetName)
    }

    var glyph: Glyph
    var category: Category
}
