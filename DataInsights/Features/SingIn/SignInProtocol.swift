//
//  SignInProtocol.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 16/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

protocol SignInViewProtocol {
    var presenter: SignInPresenterProtocol? { get set }
    
    func showErrorMessage(_ message: String)
}

protocol SignInWireframeProtocol {
    var presenter: SignInPresenterProtocol? { get set }
    
    static func presentSignInModule(inWindow window: UIWindow)
    func presentDataSetModule()
}

protocol SignInPresenterProtocol {
    var view: SignInViewProtocol? { get set }
    var wireframe: SignInWireframeProtocol? { get set }
    
    func continueButtonClicked(_ username: String?, _ password: String?)
}
