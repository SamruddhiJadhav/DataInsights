//
//  DataSetViewMock.swift
//  DataInsightsTests
//
//  Created by Jadhav, Samruddhi on 18/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

@testable import DataInsights
import XCTest

class DataSetViewMock: DataSetViewProtocol {
    var presenter: DataSetPresenterProtocol?
    var expectations = [XCTestExpectation]()
    
    func reloadTableView() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
    
    func showErrorMessage(_ message: String) {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
    
    func showLoadingIndicator() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
    
    func hideLoadingIndicator() {
        XCTestExpectation.fulfill(with: #function, from: expectations)
    }
}
