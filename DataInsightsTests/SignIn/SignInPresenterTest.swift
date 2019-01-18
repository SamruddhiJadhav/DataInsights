//
//  SignInPresenterTest.swift
//  DataInsightsTests
//
//  Created by Jadhav, Samruddhi on 18/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

@testable import DataInsights
import XCTest

class SignInPresenterTest: XCTestCase {
    let view = SignInViewMock()
    let presenter = SignInPresenter()
    let wireframe = SignInWireframeMock()
    
    override func setUp() {
        super.setUp()
        presenter.view = view
        presenter.wireframe = wireframe
    }
    
    func testIsValidUser() {
        XCTAssertTrue(presenter.isValidUser("user", "pass"))
        XCTAssertFalse(presenter.isValidUser("someUser", "somePassword"))
        XCTAssertFalse(presenter.isValidUser("", ""))
    }
    
    func testSignInButtonClicked() {
        wireframe.expectations.append(expectation(description: "presentDataSetModule()"))
        
        presenter.continueButtonClicked("user", "pass")
        
        wait(for: wireframe.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
    
    func testSignInButtonClickedWithEmptyStrings() {
        view.expectations.append(expectation(description: "showErrorMessage"))
        presenter.continueButtonClicked("", "")
        wait(for: view.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
}
