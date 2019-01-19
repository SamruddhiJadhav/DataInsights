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

    var dataSets: [DataSetResponse?] = []
    
    //MARK: - DataSetPresenter Variable
    var isFetchInProgress = false
    
    //MARK: - DataSetPresenterProtocol Methods
    func viewDidLoad() {
        view?.showLoadingIndicator()
        getDataSet(with: "")
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
            self?.view?.hideLoadingIndicator()
            self?.dataSets.append(dataSet)
            self?.isFetchInProgress = false
            DispatchQueue.main.async {
                self?.view?.reloadTableView()
            }
        }, onError: { [weak self] (error) in
            debugPrint("Error: API call failure.")
            self?.isFetchInProgress = false
            self?.view?.showErrorMessage(StringConstants.GENERIC_ERROR_MESSAGE)
            self?.view?.hideLoadingIndicator()
        })
    }
    
    func okButtonClicked() {
        wireframe?.popViewController()
    }
}
