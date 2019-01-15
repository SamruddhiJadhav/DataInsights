//
//  DataSetProtocol.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import Foundation
import UIKit

typealias FailureHandler = (_ errorMessage: String) -> Void

protocol DataSetViewProtocol {
    var presenter: DataSetPresenterProtocol? { get set }
    
    func reloadTableView(_ path: [IndexPath])
}
protocol DataSetPresenterProtocol {
    var view: DataSetViewProtocol? { get set }
    var wireframe: DataSetWireframeProtocol? { get set }
    var interactor: DataSetInteractorProtocol? { get set }
    
    
    func viewDidLoad()
    func getDataSet(with nextUrl: String)
    func getDataSet() -> [DataSetResponse?]
}
protocol DataSetInteractorProtocol {
    var presenter: DataSetPresenterProtocol? { get set }
    var dataSetService: DataSetServiceProtocol? { get set }
    
    func getDataSet(for url: String, completion: @escaping(DataSetResponse?) -> Void, onError: @escaping FailureHandler)
}
protocol DataSetWireframeProtocol {
    var presenter: DataSetPresenterProtocol? { get set }
    
    static func presentDataSetModule(inWindow window: UIWindow)
}
protocol DataSetServiceProtocol {
    func getDataSet(for url: String, completion: @escaping([String : Any]?, Error?) -> Void)
}