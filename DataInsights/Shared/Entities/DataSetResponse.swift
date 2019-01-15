//
//  DataSetResponse.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 15/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class DataSetResponse {
    var dataSet: DataSetPerYear?
    var startLink: String?
    var nextLink: String?
    var prevLink: String?
    
    init(with json: [String: Any]) {
        guard let data = json["records"] as? [[String : Any]] else {
            return
        }
        dataSet = DataSetPerYear.init(with: data)
        
        guard let links = json["_links"] as? [String: Any] else {
            return
        }
        startLink = links["start"] as? String
        nextLink = links["next"] as? String
        prevLink = links["prev"] as? String
    }
}
