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
    var quarterOneData: Double = 0.0
    var quarterTwoData: Double = 0.0
    var quarterThreeData: Double = 0.0
    var quarterFourData: Double = 0.0
    var dataUsagePerYear: Double = 0.0
    var isUsageDeclined = false
    init(with jsonData: [[String: Any]]) {
        print(jsonData)
        for data in jsonData {
            initQuarterData(data)
        }
        
        dataUsagePerYear = (quarterFourData + quarterThreeData + quarterTwoData + quarterOneData).truncate(places: 5)
        if quarterOneData >= quarterTwoData || quarterTwoData >= quarterThreeData || quarterThreeData >= quarterFourData {
            isUsageDeclined = true
        }
    }
    
    func initQuarterData(_ dataPerQuarter: [String: Any]) {
        if let quarterOfYear = dataPerQuarter["quarter"] as? String {
            let yearAndQuarter = quarterOfYear.split(separator: "-")
            
            year = String(yearAndQuarter[0])
            
            if let quarterValue = dataPerQuarter["volume_of_mobile_data"] as? String {
                let doubleQuarterValue = getDoubleFrom(string: quarterValue)
                switch yearAndQuarter[1] {
                case "Q1":
                    quarterOneData = doubleQuarterValue
                case "Q2":
                    quarterTwoData = doubleQuarterValue
                case "Q3":
                    quarterThreeData = doubleQuarterValue
                case "Q4":
                    quarterFourData = doubleQuarterValue
                default:
                    break
                }
            }
        }
    }
    
    func getDoubleFrom(string quarterValue: String?) -> Double {
        if let quarterData = quarterValue, let doubleValue = Double(quarterData) {
            return doubleValue
        }
        return 0.0
    }
}

extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
