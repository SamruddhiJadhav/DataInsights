//
//  DataSetInteractor.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class DataSetInteractor: DataSetInteractorProtocol {
    
    //MARK: - DataSetInteractorProtocol Variables
    var presenter: DataSetPresenterProtocol?
    var dataSetService: DataSetServiceProtocol?
    var isEndOfData = false
    
    //MARK: - DataSetInteractorProtocol Method
    func getDataSet(for url: String, completion: @escaping(DataSetResponse?) -> Void, onError: @escaping FailureHandler) {
        guard !isEndOfData else {
            return
        }
        dataSetService?.getDataSet(for: url, completion: { [weak self] (jsonData, error) in
            guard let dataDictionary = jsonData, !dataDictionary.isEmpty,
                let dataSetJsonResponse = dataDictionary["result"] as? [String: Any] else {
                debugPrint("Error: Failure in Interactor")
                onError(error.debugDescription)
                completion(nil)
                return
            }
            
            guard let records = dataSetJsonResponse["records"] as? [[String: Any]], !records.isEmpty else {
                self?.isEndOfData = true
                return
            }
            
            let dataSetResponse = DataSetResponse.init(with: dataSetJsonResponse)
            debugPrint("Success: Success in Interactor")
            completion(dataSetResponse)
        })
    }
}
