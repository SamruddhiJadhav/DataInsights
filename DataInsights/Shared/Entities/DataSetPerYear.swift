//
//  DataSetPerYear.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import Foundation
enum Quarter: String {
    case Q1
    case Q2
    case Q3
    case Q4
}
class DataSetPerYear {
    var year: String?
    var quarter1: Double?
    var quarter2: Double?
    var quarter3: Double?
    var quarter4: Double?
    
    init(with jsonData: [[String: Any]]) {
        print("In Datasetperyear : \(jsonData)")
        for data in jsonData {
            if let d = data["quarter"] as? String, d.contains(Quarter.Q1.rawValue) {
                if let quarterValueString = data["volume_of_mobile_data"] as? String {
                    quarter1 = Double(quarterValueString) ?? 0.0
                }
                var dataSeparated = d.split(separator: "-")
                year = String(dataSeparated[0])
            }
            
            if let d = data["quarter"] as? String, d.contains(Quarter.Q2.rawValue) {
                if let quarterValueString = data["volume_of_mobile_data"] as? String {
                    quarter2 = Double(quarterValueString) ?? 0.0
                }
            }
            
            if let d = data["quarter"] as? String, d.contains(Quarter.Q3.rawValue) {
                if let quarterValueString = data["volume_of_mobile_data"] as? String {
                    quarter3 = Double(quarterValueString) ?? 0.0
                }
            }
            if let d = data["quarter"] as? String, d.contains(Quarter.Q4.rawValue) {
                if let quarterValueString = data["volume_of_mobile_data"] as? String {
                    quarter4 = Double(quarterValueString) ?? 0.0
                }
            }
        }
    }
}
