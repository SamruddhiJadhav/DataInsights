//
//  DataSetPresenterTest.swift
//  DataInsightsTests
//
//  Created by Jadhav, Samruddhi on 18/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

@testable import DataInsights
import XCTest

class DataSetPresenterTest: XCTestCase {

    let presenter = DataSetPresenter()
    let view = DataSetViewMock()
    let interactor = DataSetInteractorMock()
    let wireframe = DataSetWireframeMock()
    
    override func setUp() {
       super.setUp()
       presenter.view = view
       presenter.interactor = interactor
       presenter.wireframe = wireframe
    }
    
    func testViewDidLoad() {
        view.expectations.append(expectation(description: "showLoadingIndicator()"))
        presenter.viewDidLoad()
        wait(for: view.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
    
    func testOkButtonClicked() {
        wireframe.expectations.append(expectation(description: "popViewController()"))
        presenter.okButtonClicked()
        wait(for: wireframe.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
    
    func testGetDataSetSuccess() {
        interactor.isNegativeTestCase = false
        view.expectations.append(expectation(description: "reloadTableView()"))
        presenter.getDataSet(with: "")
        wait(for: view.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
    
    func testGetDataSetFailure() {
        interactor.isNegativeTestCase = true
        view.expectations.append(expectation(description: "hideLoadingIndicator()"))
        view.expectations.append(expectation(description: "showErrorMessage"))
        presenter.getDataSet(with: "")
        wait(for: view.expectations, timeout: XCTestExpectation.expectationTimeout)
    }
}
