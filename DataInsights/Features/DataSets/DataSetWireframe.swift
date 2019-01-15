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
    var presenter: DataSetPresenterProtocol?
    
    static func presentDataSetModule(inWindow window: UIWindow) {
        let view: DataSetView = StoryboardUtil.instantiateView("DataSet","DataSetView")
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
        
        let rootNavigationController = StoryboardUtil.instantiateNavigationView("DataSet","NavigationView")
        let dataSetView = view as DataSetView
        rootNavigationController.viewControllers = [dataSetView]
        
        window.rootViewController = rootNavigationController
    }
}
