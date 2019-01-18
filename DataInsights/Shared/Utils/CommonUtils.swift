//
//  CommonUtils.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 18/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class CommonUtils {
    static func getDoubleFrom(string quarterValue: String?) -> Double? {
        if let quarterData = quarterValue, let doubleValue = Double(quarterData) {
            return doubleValue
        }
        return nil
    }
}
