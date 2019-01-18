//
//  SignInWireframe.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 16/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class SignInWireframe: SignInWireframeProtocol{
    // MARK: - SignInWireframeProtocol Variable
    var presenter: SignInPresenterProtocol?
    
    // MARK: - SignInWireframe Constants
    static let STORYBOARD_ID = "SignIn"
    static let STORYBOARD_VIEW_ID = "SignInView"
    static let STORYBOARD_NAVIGATION_VIEW_ID = "NavigationController"
    
    // MARK: - SignInWireframeProtocol methods
    static func presentSignInModule(inWindow window: UIWindow) {
        let view: SignInView = StoryboardUtil.instantiateView(SignInWireframe.STORYBOARD_ID,
                                                              SignInWireframe.STORYBOARD_VIEW_ID)
        let presenter = SignInPresenter()
        let wireframe = SignInWireframe()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        wireframe.presenter = presenter
        
        let rootNavigationController = StoryboardUtil.instantiateNavigationView(SignInWireframe.STORYBOARD_ID,
                                                                                SignInWireframe.STORYBOARD_NAVIGATION_VIEW_ID)
        let signInView = view as SignInView
        rootNavigationController.viewControllers = [signInView]
        
        window.rootViewController = rootNavigationController
    }
    
    func presentDataSetModule() {
        guard let view = presenter?.view as? UIViewController else {
            return
        }
        DataSetWireframe.presentDataSetModule(fromView: view)
    }
}
