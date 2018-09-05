//
//  ButtonsUITests.swift
//  ButtonsUITests
//
//  Created by Glenn Wilson on 8/31/18.
//

import XCTest

class ButtonsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // For information on grouping tests into substeps with activities
    // See: https://developer.apple.com/documentation/xctest/activities_and_attachments/grouping_tests_into_substeps_with_activities
    // In App Center Test each activity will display as a separate test step with screenshot
    func testPass() {
        
        let app = XCUIApplication()
        
        let lessButton = app.buttons["Less"]
        let moreButton = app.buttons["More"]
        let resetButton = app.buttons["Reset"]

        // amountLabel from Accessibility Identifier in storyboard
        let amountLabel = app.staticTexts["AmountLabelID"]

        XCTContext.runActivity(named: "Loaded") { activity in
            XCTAssertEqual(lessButton.exists, true)
            XCTAssertEqual(moreButton.exists, true)
            XCTAssertEqual(resetButton.exists, true)
            XCTAssertEqual(amountLabel.exists, true)
        }
        
        XCTContext.runActivity(named: "Reset") { activity in
            resetButton.tap()
            XCTAssertEqual(amountLabel.value as! String, "0")
        }

        XCTContext.runActivity(named: "Up To One") { activity in
            moreButton.tap()
            XCTAssertEqual(amountLabel.value as! String, "1")
        }

        XCTContext.runActivity(named: "Up To Two") { activity in
            moreButton.tap()
            XCTAssertEqual(amountLabel.value as! String, "2")
        }

        XCTContext.runActivity(named: "Down To One") { activity in
            lessButton.tap()
            XCTAssertEqual(amountLabel.value as! String, "1")
        }

        XCTContext.runActivity(named: "Down To Zero") { activity in
            lessButton.tap()
            XCTAssertEqual(amountLabel.value as! String, "0")
        }
    }
    
    // In App Center Test this test will display with no substeps and only one final screenshot
    func testNoActivities() {

        let app = XCUIApplication()
        
        let moreButton = app.buttons["More"]
        
        // amountLabel from Accessibility Identifier in storyboard
        let amountLabel = app.staticTexts["AmountLabelID"]
        
        XCTAssertEqual(moreButton.exists, true)
        XCTAssertEqual(amountLabel.exists, true)

        moreButton.tap()
        XCTAssertEqual(amountLabel.value as! String, "1")

        moreButton.tap()
        XCTAssertEqual(amountLabel.value as! String, "2")
    }
    
}
