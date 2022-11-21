//
//  AlbumApiUnitTests.swift
//  DKBCodeTests
//
//  Created by Anurita Srivastava on 20/11/22.
//  Copyright © 2022 Anurita. All rights reserved.
//

import UIKit
import XCTest
import DKBCode

class AlbumApiUnitTests: XCTestCase {
        
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func test_AlbumApiResource_With_ValidRequest(){

        // ARRANGE
        let dummyAlbumData = MockApiResponseModule()?.albumOne
        let expectation = self.expectation(description: "ValidRequest_Returns_ApiResponse")

        AlbumService.shared.getSingleAlbum(1, success: { (code, downloadedAlbum) in
            
            // ASSERT
            XCTAssertNotNil(downloadedAlbum)
            XCTAssertEqual(code, 200)
            XCTAssertEqual(dummyAlbumData?.id, downloadedAlbum.id)
            XCTAssertEqual(dummyAlbumData?.title, downloadedAlbum.title)
            XCTAssertEqual(dummyAlbumData?.imageUrl, downloadedAlbum.imageUrl)
            expectation.fulfill()
        }) { (code) in
            print(code)
            fatalError("Unable to download api response")
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func test_AlbumApiResource_With_Errors(){

        // ARRANGE
        let expectation = self.expectation(description: "InValidRequest_Returns_Error")

        AlbumService.shared.getSingleAlbum(-10, success: { (code, downloadedAlbum) in
            
            // ASSERT
            XCTAssertNil(downloadedAlbum)
            XCTAssertNotEqual(code, 200)
            XCTAssertNotEqual(code, 201)
            expectation.fulfill()
        }) { (code) in
            print(code)
            XCTAssertNotEqual(code, 200)
            XCTAssertNotEqual(code, 201)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
