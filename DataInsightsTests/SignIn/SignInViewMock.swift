//
//  SignInViewMock.swift
//  DataInsightsTests
//
//  Created by Jadhav, Samruddhi on 18/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

@testable import DataInsights
import XCTest

class SignInViewMock: SignInViewProtocol {
    var presenter: SignInPresenterProtocol?
    var expectations = [XCTestExpectation]()
    
    func showErrorMessage(_ message: String) {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}
