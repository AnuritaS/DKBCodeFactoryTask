//
//  DKBCodeUITestsLaunchTests.swift
//  DKBCodeUITests
//
//  Created by Anurita Srivastava on 21/11/22.
//  Copyright © 2022 Anurita. All rights reserved.
//

import XCTest

class DKBCodeUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
                
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "LaunchScreen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
