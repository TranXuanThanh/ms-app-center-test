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
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPass() {
        
        let app = XCUIApplication()
        
        let lessButton = app.buttons["Less"]
        let moreButton = app.buttons["More"]
        let resetButton = app.buttons["Reset"]

        // amountLabel from Accessibility Identifier in storyboard
        let amountLabel = app.staticTexts["AmountLabelID"]

        XCTAssertEqual(lessButton.exists, true)
        XCTAssertEqual(moreButton.exists, true)
        
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
    
    func testNoActivities() {

        let app = XCUIApplication()
        
        let moreButton = app.buttons["More"]
        
        // amountLabel from Accessibility Identifier in storyboard
        let amountLabel = app.staticTexts["AmountLabelID"]
        
        XCTAssertEqual(moreButton.exists, true)

        moreButton.tap()
        XCTAssertEqual(amountLabel.value as! String, "1")

        moreButton.tap()
        XCTAssertEqual(amountLabel.value as! String, "2")
    }
    
//    func testFail() {
//        
//        let app = XCUIApplication()
//        
//        let resetButton = app.buttons["Reset"]
//        
//        let amountLabel = app.staticTexts["AmountLabelID"]
//        
//        XCTContext.runActivity(named: "Test for 1 After Reset") { activity in
//            resetButton.tap()
//            XCTAssertEqual(amountLabel.value as! String, "1")
//        }
//    }

}
