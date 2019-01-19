//
//  CommonUtilTest.swift
//  DataInsightsTests
//
//  Created by Jadhav, Samruddhi on 19/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

@testable import DataInsights
import XCTest

class CommonUtilTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testGetDoubleFromString() {
        let doubleValue = CommonUtils.getDoubleFrom(string: "string")
        XCTAssertNil(doubleValue)
    }
    
    func testGetDoubleFromValidString() {
        let doubleValue = CommonUtils.getDoubleFrom(string: "12.0")
        XCTAssertEqual(doubleValue, 12.0)
    }
}
