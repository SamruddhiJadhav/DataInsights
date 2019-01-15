//
//  DataSetPresenter.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import Foundation
class DataSetPresenter: DataSetPresenterProtocol {
    
    //MARK: - DataSetPresenterProtocol Variables
    var view: DataSetViewProtocol?
    var wireframe: DataSetWireframeProtocol?
    var interactor: DataSetInteractorProtocol?
    
    var dataSets: [DataSetResponse?] = [DataSetResponse?](repeating: nil, count: 0)
    var isFetchInProgress = false
    
    //MARK: - DataSetPresenterProtocol Methods
    func viewDidLoad() {
        getDataSet(with: "")
    }
    
    func getDataSet() -> [DataSetResponse?] {
        return dataSets
    }
    
    func getDataSet(with nextUrl: String) {
        guard !isFetchInProgress else {
            return
        }
        isFetchInProgress = true
        interactor?.getDataSet(for: nextUrl, completion: { [weak self] (dataSetResponse) in
            guard let dataSet = dataSetResponse else {
                return
            }
            self?.dataSets.append(dataSet)
            self?.isFetchInProgress = false
            DispatchQueue.main.async {
                self?.view?.reloadTableView([])
            }
        }, onError: { [weak self] (error) in
            self?.isFetchInProgress = false
            print(error)
        })
    }
}
