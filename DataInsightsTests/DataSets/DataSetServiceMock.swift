//
//  DataSetServiceMock.swift
//  DataInsightsTests
//
//  Created by Jadhav, Samruddhi on 18/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

@testable import DataInsights
import XCTest

class DataSetServiceMock: DataSetServiceProtocol {
    func getDataSet(for url: String, completion: @escaping ([String : Any]?, Error?) -> Void) {
        
    }
}
