//
//  DataSetPresenter.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import Foundation
class DataSetPresenter: DataSetPresenterProtocol {
    var view: DataSetViewProtocol?
    var wireframe: DataSetWireframeProtocol?
    var interactor: DataSetInteractorProtocol?
    
    var dataSets: [DataSetResponse?] = [DataSetResponse?](repeating: nil, count: 10)
    
    var isFetchInProgress = false
    var currentCount = 0
    
    func viewDidLoad() {
        
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
            self?.dataSets[self?.currentCount ?? 0] = dataSet
            self?.currentCount += 1
            //print(dataSetResponse)
            self?.isFetchInProgress = false
            DispatchQueue.main.async {
                if self?.dataSets.count ?? 0 > 1 {
                    let indexPathsToReload = self?.calculateIndexPathsToReload()
                    self?.view?.reloadTableView(indexPathsToReload ?? [])
                } else {
                    self?.view?.reloadTableView([])
                }
            }
        }, onError: { [weak self] (error) in
            self?.isFetchInProgress = false
            print(error)
        })
    }
    
    private func calculateIndexPathsToReload() -> [IndexPath] {
        let startIndex = 4
        let endIndex = startIndex + 4
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
}
