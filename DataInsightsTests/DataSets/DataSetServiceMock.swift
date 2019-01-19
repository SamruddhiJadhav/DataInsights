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
    var isNegativeTestCase = false
    
    func getDataSet(for url: String, completion: @escaping ([String : Any]?, Error?) -> Void) {
        if isNegativeTestCase {
            completion(nil, nil)
        } else {
            let dataSet = ["records": [[
                "volume_of_mobile_data": "9.171586",
                "quarter": "2011-Q1",
                "_id": 15 ],
                [
                "volume_of_mobile_data": "8.248899",
                "quarter": "2011-Q2",
                "_id": 16 ],
                [
                "volume_of_mobile_data": "5.439655",
                "quarter": "2011-Q3",
                "_id": 17
                ], [
                "volume_of_mobile_data": "10.683579",
                "quarter": "2011-Q4",
                "_id": 18
                ]
                ],
                "_links": [
                    "start": "/api/action/datastore_search?limit=4&resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f",
                    "prev": "/api/action/datastore_search?offset=10&limit=4&resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f",
                    "next": "/api/action/datastore_search?offset=18&limit=4&resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f"
                ]] as [String: Any]
            
            let jsonDict = ["result": dataSet] as [String: Any]?
            completion(jsonDict, nil)
        }
    }
}
