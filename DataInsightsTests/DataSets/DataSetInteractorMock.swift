//
//  DataSetInteractorMock.swift
//  DataInsightsTests
//
//  Created by Jadhav, Samruddhi on 18/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

@testable import DataInsights
import XCTest

class DataSetInteractorMock: DataSetInteractorProtocol {
    var presenter: DataSetPresenterProtocol?
    
    var dataSetService: DataSetServiceProtocol?
    
    func getDataSet(for url: String, completion: @escaping (DataSetResponse?) -> Void, onError: @escaping FailureHandler) {
        <#code#>
    }

}
