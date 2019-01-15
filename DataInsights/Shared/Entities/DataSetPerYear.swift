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

    var quarterOneData: String?
    var quarterTwoData: String?
    var quarterThreeData: String?
    var quarterFourData: String?
    
    init(with jsonData: [[String: Any]]) {
        for data in jsonData {
            initQuarterData(data)
        }
    }
    
    func initQuarterData(_ dataPerQuarter: [String: Any]) {
        if let quarterOfYear = dataPerQuarter["quarter"] as? String {
            let yearAndQuarter = quarterOfYear.split(separator: "-")
            year = String(yearAndQuarter[0])
            if let quarterValue = dataPerQuarter["volume_of_mobile_data"] as? String {
                switch yearAndQuarter[1] {
                case "Q1":
                    quarterOneData = quarterValue
                case "Q2":
                    quarterTwoData = quarterValue
                case "Q3":
                    quarterThreeData = quarterValue
                case "Q4":
                    quarterFourData = quarterValue
                default:
                    break
                }
            }
        }
    }
}
