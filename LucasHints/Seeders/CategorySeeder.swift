//
//  CategorySeeder.swift
//  LucasHints
//
//  Created by Aaron Krauss on 8/1/24.
//

import Foundation
import SwiftUI

func seedCategories() -> [Category] {
    return [
        Category(
            name: "Animal",
            color: Color(hue: 0.1, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "cow"),
                Glyph(assetName: "bird"),
                Glyph(assetName: "dragon"),
                Glyph(assetName: "fish"),
                Glyph(assetName: "fox"),
                Glyph(assetName: "horse"),
                Glyph(assetName: "monkey"),
                Glyph(assetName: "paw-print"),
                Glyph(assetName: "pig"),
                Glyph(assetName: "rat"),
            ]
        ),
        Category(
            name: "Building",
            color: Color(hue: 0.2, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "castle"),
                Glyph(assetName: "city"),
                Glyph(assetName: "factory"),
                Glyph(assetName: "hotel"),
                Glyph(assetName: "house"),
                Glyph(assetName: "library"),
                Glyph(assetName: "restaurant"),
                Glyph(assetName: "school"),
                Glyph(assetName: "shop"),
                Glyph(assetName: "tent"),
            ]
        ),
        Category(
            name: "Elemental",
            color: Color(hue: 0.3, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "fire"),
                Glyph(assetName: "heart"),
                Glyph(assetName: "hourglass"),
                Glyph(assetName: "ice"),
                Glyph(assetName: "idea"),
                Glyph(assetName: "leaf"),
                Glyph(assetName: "lightning"),
                Glyph(assetName: "pentagram"),
                Glyph(assetName: "water"),
                Glyph(assetName: "wind"),
            ]
        ),
        Category(
            name: "Emotion",
            color: Color(hue: 0.4, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "angry"),
                Glyph(assetName: "cool"),
                Glyph(assetName: "expressionless"),
                Glyph(assetName: "frustrated"),
                Glyph(assetName: "happy"),
                Glyph(assetName: "in-love"),
                Glyph(assetName: "laughing"),
                Glyph(assetName: "melting"),
                Glyph(assetName: "surprised"),
                Glyph(assetName: "sweat-smile"),
            ]
        ),
        Category(
            name: "Food",
            color: Color(hue: 0.5, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "apple"),
                Glyph(assetName: "beer"),
                Glyph(assetName: "bread"),
                Glyph(assetName: "chicken-leg"),
                Glyph(assetName: "corn"),
                Glyph(assetName: "grapes"),
                Glyph(assetName: "milk"),
                Glyph(assetName: "rice-bowl"),
                Glyph(assetName: "water-cup"),
                Glyph(assetName: "wine"),
            ]
        ),
        Category(
            name: "Inventory",
            color: Color(hue: 0.6, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "backpack"),
                Glyph(assetName: "bandage"),
                Glyph(assetName: "book"),
                Glyph(assetName: "compass"),
                Glyph(assetName: "guitar"),
                Glyph(assetName: "jewel"),
                Glyph(assetName: "lantern"),
                Glyph(assetName: "money"),
                Glyph(assetName: "potion"),
                Glyph(assetName: "treasure-chest"),
            ]
        ),
        Category(
            name: "Landscape",
            color: Color(hue: 0.7, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "beach"),
                Glyph(assetName: "bridge"),
                Glyph(assetName: "campfire"),
                Glyph(assetName: "cave"),
                Glyph(assetName: "desert"),
                Glyph(assetName: "flower"),
                Glyph(assetName: "mountain"),
                Glyph(assetName: "ocean"),
                Glyph(assetName: "trees"),
                Glyph(assetName: "waterfall"),
            ]
        ),
        Category(
            name: "Tools",
            color: Color(hue: 0.8, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "bow-and-arrow"),
                Glyph(assetName: "fist"),
                Glyph(assetName: "hammer"),
                Glyph(assetName: "paint"),
                Glyph(assetName: "pickaxe"),
                Glyph(assetName: "saw"),
                Glyph(assetName: "shield"),
                Glyph(assetName: "shovel"),
                Glyph(assetName: "sword"),
                Glyph(assetName: "wand"),
            ]
        ),
        Category(
            name: "Transportation",
            color: Color(hue: 0.9, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "bicycle"),
                Glyph(assetName: "boat"),
                Glyph(assetName: "bus"),
                Glyph(assetName: "delivery"),
                Glyph(assetName: "map"),
                Glyph(assetName: "rocket"),
                Glyph(assetName: "running"),
                Glyph(assetName: "street"),
                Glyph(assetName: "train"),
                Glyph(assetName: "wagon"),
            ]
        ),
        Category(
            name: "Weather",
            color: Color(hue: 1, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "clouds"),
                Glyph(assetName: "moon"),
                Glyph(assetName: "partly-cloudy"),
                Glyph(assetName: "rain"),
                Glyph(assetName: "rainbow"),
                Glyph(assetName: "snow"),
                Glyph(assetName: "star"),
                Glyph(assetName: "sun"),
                Glyph(assetName: "sunrise"),
                Glyph(assetName: "thunderstorm"),
            ]
        ),
    ]
}
