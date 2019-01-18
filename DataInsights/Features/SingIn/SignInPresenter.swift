//
//  SignInPresenter.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 16/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class SignInPresenter: SignInPresenterProtocol {
    
    // MARK: - SignInPresenterProtocol Variables
    var view: SignInViewProtocol?
    var wireframe: SignInWireframeProtocol?
    
    // MARK: - SignInPresenterProtocol method
    func continueButtonClicked(_ username: String?, _ password: String?) {
        if isValidUser(username, password) {
            print("Success: Signed In")
            wireframe?.presentDataSetModule()
        } else {
            print("Error: Sign In failed")
            view?.showErrorMessage(StringConstants.INCORRECT_USERNAME_OR_PASSWORD)
        }
    }
    
    // MARK: - Helper Method
    func isValidUser(_ username: String?, _ password: String?) -> Bool {
        return username == "user" && password == "pass"
    }
}
