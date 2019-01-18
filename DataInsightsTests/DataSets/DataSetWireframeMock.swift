//
//  DataSetWireframeMock.swift
//  DataInsightsTests
//
//  Created by Jadhav, Samruddhi on 18/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

@testable import DataInsights
import XCTest

class DataSetWireframeMock: DataSetWireframeProtocol {
    var presenter: DataSetPresenterProtocol?
    var expectations = [XCTestExpectation]()
    
    static func presentDataSetModule(fromView vc: UIViewController) {}
    
    func popViewController() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}
