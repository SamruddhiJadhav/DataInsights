//
//  DataSetInteractorTest.swift
//  DataInsightsTests
//
//  Created by Jadhav, Samruddhi on 18/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

@testable import DataInsights
import XCTest

class DataSetInteractorTest: XCTestCase {
    var interactor = DataSetInteractor()
    let service = DataSetServiceMock()
    
    override func setUp() {
        super.setUp()
        interactor.dataSetService = service
    }
    
    func testGetDataSetSuccess() {
        service.isNegativeTestCase = false
        
        interactor.getDataSet(for: "", completion: { (dataSetResponse) in
            XCTAssertEqual(dataSetResponse?.startLink, "/api/action/datastore_search?limit=4&resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f")
            XCTAssert(dataSetResponse?.prevLink == "/api/action/datastore_search?offset=10&limit=4&resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f")
            XCTAssert(dataSetResponse?.nextLink == "/api/action/datastore_search?offset=18&limit=4&resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f")
            
        }, onError: { (error) in
            XCTAssertNil(error)
        })
    }
    
    func testGetDataSetFailure() {
        service.isNegativeTestCase = true
        interactor.getDataSet(for: "", completion: { (dataResponse) in
            XCTAssertNil(dataResponse)
        }) { (error) in
            XCTAssertNotNil(error)
        }
    }
}
