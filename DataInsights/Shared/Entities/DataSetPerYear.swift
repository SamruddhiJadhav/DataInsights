//
//  DataSetPerYear.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class DataSetPerYear {
    var year: String?
    var quarterDataList: [Double?]
    var dataUsagePerYear: Double = 0.0
    var isUsageDeclined = false
    
    init(with jsonData: [[String: Any]]) {
        quarterDataList = [Double?]()
        
        if let quarterOfYear = jsonData[0]["quarter"] as? String {
            let yearAndQuarter = quarterOfYear.components(separatedBy: StringConstants.SEPARATOR)
            year = yearAndQuarter.first ?? ""
        }
        
        for quarterData in jsonData {
            initQuarterData(quarterData)
        }
        
        for index in 0..<quarterDataList.count {
            dataUsagePerYear += quarterDataList[index] ?? 0.0
            if index + 1 < quarterDataList.count, let currentQuarterData = quarterDataList[index], let nextQuarterData = quarterDataList[index + 1], currentQuarterData > nextQuarterData {
                isUsageDeclined = true
            }
        }
        dataUsagePerYear = dataUsagePerYear.truncate(places: Constants.PRECISION)
    }
    
    func initQuarterData(_ dataPerQuarter: [String: Any]) {
        if let quarterValue = dataPerQuarter["volume_of_mobile_data"] as? String {
            let doubleQuarterValue = CommonUtils.getDoubleFrom(string: quarterValue)
            quarterDataList.append(doubleQuarterValue)
        }
    }
}
