//
//  ActivityControllerAppUITests.swift
//  ActivityControllerAppUITests
//
//  Created by Jayme Rutkoski on 8/21/23.
//

import XCTest

final class ActivityControllerAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCopy() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["TEST ME"].tap()
                
        XCUIApplication().collectionViews.containing(.cell, identifier: "Copy").element.tap()

        XCTAssertTrue(UIPasteboard.general.numberOfItems > 0)
    }
    
    func testSaveToFiles() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["TEST ME"].tap()
        
        let element = app/*@START_MENU_TOKEN@*/.navigationBars["UIActivityContentView"]/*[[".otherElements[\"ActivityListView\"].navigationBars[\"UIActivityContentView\"]",".navigationBars[\"UIActivityContentView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element.tap()
        element.swipeUp()
        
        let collectionViewsQuery = app.collectionViews

        collectionViewsQuery.children(matching: .cell).matching(identifier: "XCElementSnapshotPrivilegedValuePlaceholder").element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 2).tap()
        app.navigationBars["FullDocumentManagerViewControllerNavigationBar"].buttons["Save"].tap()
        
        let replaceAlert = app.alerts["Replace Existing Items?"].exists
        if replaceAlert {
            app.alerts["Replace Existing Items?"].scrollViews.otherElements.buttons["Replace"].tap()
        }
    }
}
