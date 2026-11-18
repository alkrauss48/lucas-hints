//
//  LucasHintsTests.swift
//  LucasHintsTests
//
//  Created by Aaron Krauss on 7/28/24.
//

import UIKit
import XCTest
@testable import LucasHints

final class LucasHintsTests: XCTestCase {
    var appState: AppState?

    override func setUpWithError() throws {
        appState = AppState()
    }

    func testAppStateInit() throws {
        XCTAssert(appState!.activeGlyphs.count > 0)
    }

    func testAppStateRegenerate() throws {
        let originalGlyphs = Set(appState!.activeGlyphs)

        appState!.regenerateUiGlyphs()

        let newGlyphs = Set(appState!.activeGlyphs)

        XCTAssert(newGlyphs.intersection(originalGlyphs).count == 0)
    }

    func testGlyphAssetNamesAreUnique() throws {
        let assetNames = seedCategories().flatMap { $0.glyphs.map(\.assetName) }

        XCTAssertEqual(Set(assetNames).count, assetNames.count)
    }

    func testEveryGlyphHasAnAsset() throws {
        for category in seedCategories() {
            for glyph in category.glyphs {
                XCTAssertNotNil(
                    UIImage(named: glyph.assetName),
                    "Missing asset for \(glyph.assetName) in \(category.name)"
                )
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            appState!.regenerateUiGlyphs()
        }
    }
}
