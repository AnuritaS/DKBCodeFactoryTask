//
//  DKBCodeUITests.swift
//  DKBCodeUITests
//
//  Created by Anurita Srivastava on 21/11/22.
//  Copyright © 2022 Anurita. All rights reserved.
//

import XCTest
import DKBCode

class DKBCodeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func testUI() throws {
        // ARRANGE
        let dummyAlbumData = MockApiResponseModule()?.albumOne
        let app = XCUIApplication()
        app.launch()
       
        // Given
        let albumLabel = app.staticTexts[dummyAlbumData?.title ?? ""]
        albumLabel.tap()
        
        // ASSERT
        XCTAssertTrue(albumLabel.exists)

        app.navigationBars["DKBCode.AlbumDetailView"].buttons["Albums"].tap()
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
