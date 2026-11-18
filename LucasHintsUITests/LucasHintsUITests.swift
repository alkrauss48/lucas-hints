//
//  LucasHintsUITests.swift
//  LucasHintsUITests
//
//  Created by Aaron Krauss on 7/28/24.
//

import XCTest

final class LucasHintsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation
        // - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testAllIconsSheetOpensAndCloses() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["allIconsButton"].tap()
        XCTAssertTrue(app.navigationBars["All Icons"].waitForExistence(timeout: 5))

        let screenshot = XCTAttachment(screenshot: app.screenshot())
        screenshot.name = "All Icons"
        screenshot.lifetime = .keepAlways
        add(screenshot)

        app.buttons["Close"].tap()
        XCTAssertTrue(app.buttons["newHintsButton"].waitForExistence(timeout: 5))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
