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
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
