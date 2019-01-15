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
        if let data = json["records"] as? [[String : Any]] {
            dataSet = DataSetPerYear.init(with: data)
        }
        
        if let links = json["_links"] as? [String: Any] {
            startLink = links["start"] as? String
            nextLink = links["next"] as? String
            prevLink = links["prev"] as? String
        }
    }
}
