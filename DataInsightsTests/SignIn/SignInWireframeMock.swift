//
//  SignInWireframeMock.swift
//  DataInsightsTests
//
//  Created by Jadhav, Samruddhi on 18/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

@testable import DataInsights
import XCTest

class SignInWireframeMock: SignInWireframeProtocol {
    var presenter: SignInPresenterProtocol?
    var expectations = [XCTestExpectation]()
    
    static func presentSignInModule(inWindow window: UIWindow) {}
    
    func presentDataSetModule() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}
