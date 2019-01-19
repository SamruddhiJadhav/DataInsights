//
//  DataInsightsUITests.swift
//  DataInsightsUITests
//
//  Created by Jadhav, Samruddhi on 11/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import XCTest

class DataInsightsUITests: XCTestCase {

    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launchArguments.append("--uitesting")
        app.launch()
    }
    
    func testSignInSuccess() {
        let continueButton = app.buttons.element(matching: .button, identifier: "continueButton")
        if continueButton.waitForExistence(timeout: 5.0) {
            let usernameField = app.textFields.element(matching: .textField, identifier: "usernameTextField")
            usernameField.tap()
            usernameField.typeText("user")
            
            let passwordField = app.secureTextFields.element(matching: .secureTextField, identifier: "passwordTextField")
            passwordField.tap()
            passwordField.typeText("pass")
            
            continueButton.tap()
            
            let declineImage = app.tables.children(matching: .cell).element(boundBy: 3).buttons.element(matching: .button, identifier: "declineImage")
             
            declineImage.tap()
            
            let errorAlert = app.alerts
            errorAlert.buttons.element(boundBy: 0).tap()
        } else {
            XCTFail()
        }
    }
    
    func testSignInFailure() {
        let continueButton = app.buttons.element(matching: .button, identifier: "continueButton")
        if continueButton.waitForExistence(timeout: 5.0) {
            let usernameField = app.textFields.element(matching: .textField, identifier: "usernameTextField")
            usernameField.tap()
            usernameField.typeText("user")
            
            let passwordField = app.secureTextFields.element(matching: .secureTextField, identifier: "passwordTextField")
            passwordField.tap()
            passwordField.typeText("password")
            
            continueButton.tap()
            let errorAlert = app.alerts
            errorAlert.buttons.element(boundBy: 0).tap()
        } else {
            XCTFail()
        }
    }
}
