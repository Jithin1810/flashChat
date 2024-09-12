//
//  FlashChatUITests.swift
//  FlashChatUITests
//
//  Created by JiTHiN on 12/09/24.
//

import XCTest

final class FlashChatUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        let loginButton = app.buttons["Log In"]
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
        
        let emailTextField = app.textFields["Email"]
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText("1@gmail.com")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("123123")
        
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
        
        let logOutButton = app.navigationBars["⚡️FlashChat"].buttons["Logout"]
        logOutButton.tap()
                
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
