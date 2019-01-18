//
//  XCTestExpectation.swift
//  DataInsightsTests
//
//  Created by Jadhav, Samruddhi on 18/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import XCTest

extension XCTestExpectation {
    static let expectationTimeout = 0.3
    
    static func fulfill(with fulfilledDescription: String, from expectations: [XCTestExpectation]) {
        for testExpectation in expectations {
            if testExpectation.expectationDescription == fulfilledDescription {
                testExpectation.fulfill()
            }
        }
    }
}
