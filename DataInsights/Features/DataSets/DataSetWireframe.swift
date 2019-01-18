//
//  DataSetWireframe.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import Foundation
import UIKit

class DataSetWireframe: DataSetWireframeProtocol {
    
    //MARK: - DataSetWireframeProtocol Variable
    var presenter: DataSetPresenterProtocol?
    
    //MARK: - DataSetWireframe Constants
    static let STORYBOARD_ID = "DataSet"
    static let STORYBOARD_VIEW_ID = "DataSetView"
    
    //MARK: - DataSetWireframeProtocol Method
    static func presentDataSetModule(fromView vc: UIViewController) {
        let view: DataSetView = StoryboardUtil.instantiateView(DataSetWireframe.STORYBOARD_ID,
                                                               DataSetWireframe.STORYBOARD_VIEW_ID)
        let presenter = DataSetPresenter()
        let wireframe = DataSetWireframe()
        let interactor = DataSetInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        wireframe.presenter = presenter
        
        interactor.dataSetService = DataSetService()
        
        vc.navigationController?.pushViewController(view, animated: true)
    }
    
    func popViewController() {
        guard let view = presenter?.view as? UIViewController else {
            return
        }
        view.navigationController?.popViewController(animated: true)
    }
}
