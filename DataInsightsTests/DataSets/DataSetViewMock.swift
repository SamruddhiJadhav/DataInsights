//
//  DataSetViewMock.swift
//  DataInsightsTests
//
//  Created by Jadhav, Samruddhi on 18/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

@testable import DataInsights
import XCTest

class DataSetViewMock: DataSetViewProtocol {
    var presenter: DataSetPresenterProtocol?
    
    func reloadTableView(_ path: [IndexPath]) {
        <#code#>
    }
}
