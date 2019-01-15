//
//  DataSetInteractor.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class DataSetInteractor: DataSetInteractorProtocol {
    var presenter: DataSetPresenterProtocol?
    var dataSetService: DataSetServiceProtocol?
    
    func getDataSet(for url: String, completion: @escaping(DataSetResponse?) -> Void, onError: @escaping FailureHandler) {
        dataSetService?.getDataSet(for: url, completion: { (jsonData, error) in
            var dataSetResponse: DataSetResponse?
            guard let dict = jsonData, !dict.isEmpty else {
                print("Error: Failure in Interactor")
                onError(error.debugDescription)
                return
            }
            guard let dataSetJson = dict["result"] as? [String: Any] else {
                completion(nil)
                return
            }
            
            dataSetResponse = DataSetResponse.init(with: dataSetJson)
            print("Success: Success in Interactor")
            completion(dataSetResponse)
        })
    }
}
