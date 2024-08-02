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
            color: Color(hue: 1 / 13.0, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "cow"),
                Glyph(assetName: "bird"),
                Glyph(assetName: "dragon"),
                Glyph(assetName: "fish"),
                Glyph(assetName: "bear"),
                Glyph(assetName: "horse"),
                Glyph(assetName: "monkey"),
                Glyph(assetName: "dog"),
                Glyph(assetName: "pig"),
                Glyph(assetName: "turtle"),
            ]
        ),
        Category(
            name: "Building",
            color: Color(hue: 2 / 13.0, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "castle"),
                Glyph(assetName: "city"),
                Glyph(assetName: "factory"),
                Glyph(assetName: "hotel"),
                Glyph(assetName: "house"),
                Glyph(assetName: "library"),
                Glyph(assetName: "restaurant"),
                Glyph(assetName: "trash"),
                Glyph(assetName: "shop"),
                Glyph(assetName: "tent"),
            ]
        ),
        Category(
            name: "Elemental",
            color: Color(hue: 3 / 13.0, saturation: 0.1, brightness: 0.95),
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
            color: Color(hue: 4 / 13.0, saturation: 0.1, brightness: 0.95),
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
            color: Color(hue: 5 / 13.0, saturation: 0.1, brightness: 0.95),
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
            color: Color(hue: 6 / 13.0, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "backpack"),
                Glyph(assetName: "bandage"),
                Glyph(assetName: "book"),
                Glyph(assetName: "compass"),
                Glyph(assetName: "guitar"),
                Glyph(assetName: "jewel"),
                Glyph(assetName: "lantern"),
                Glyph(assetName: "logs"),
                Glyph(assetName: "potion"),
                Glyph(assetName: "pen"),
            ]
        ),
        Category(
            name: "Landscape",
            color: Color(hue: 7 / 13.0, saturation: 0.1, brightness: 0.95),
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
            color: Color(hue: 8 / 13.0, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "bow-and-arrow"),
                Glyph(assetName: "fishing-net"),
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
            color: Color(hue: 9 / 13.0, saturation: 0.1, brightness: 0.95),
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
            color: Color(hue: 10 / 13.0, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "planet"),
                Glyph(assetName: "moon"),
                Glyph(assetName: "partly-cloudy"),
                Glyph(assetName: "rain"),
                Glyph(assetName: "rainbow"),
                Glyph(assetName: "comet"),
                Glyph(assetName: "star"),
                Glyph(assetName: "sun"),
                Glyph(assetName: "sunrise"),
                Glyph(assetName: "thunderstorm"),
            ]
        ),
        Category(
            name: "Celebration",
            color: Color(hue: 11 / 13.0, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "balloons"),
                Glyph(assetName: "birthday-cake"),
                Glyph(assetName: "champagne"),
                Glyph(assetName: "crown"),
                Glyph(assetName: "festival-banner"),
                Glyph(assetName: "gift"),
                Glyph(assetName: "money"),
                Glyph(assetName: "party-hat"),
                Glyph(assetName: "treasure-chest"),
                Glyph(assetName: "trophy"),
            ]
        ),
        Category(
            name: "Gesture",
            color: Color(hue: 12 / 13.0, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "clapping"),
                Glyph(assetName: "fist"),
                Glyph(assetName: "flex"),
                Glyph(assetName: "handshake"),
                Glyph(assetName: "keep-quiet"),
                Glyph(assetName: "peace-sign"),
                Glyph(assetName: "pointing"),
                Glyph(assetName: "pray-icon"),
                Glyph(assetName: "thumbs-down"),
                Glyph(assetName: "thumbs-up"),
            ]
        ),
        Category(
            name: "Sign",
            color: Color(hue: 13 / 13.0, saturation: 0.1, brightness: 0.95),
            glyphs: [
                Glyph(assetName: "down-arrow"),
                Glyph(assetName: "go-slow"),
                Glyph(assetName: "go"),
                Glyph(assetName: "left-arrow"),
                Glyph(assetName: "nuclear"),
                Glyph(assetName: "one-way"),
                Glyph(assetName: "redo"),
                Glyph(assetName: "right-arrow"),
                Glyph(assetName: "stop"),
                Glyph(assetName: "up-arrow"),
            ]
        ),
    ]
}
