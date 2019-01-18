//
//  SignInView.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 16/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class SignInView: UIViewController, SignInViewProtocol {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var continueButton: UIButton!
    
    // MARK: - SignInViewProtocol Variable
    var presenter: SignInPresenterProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboard()
        setUpAccessibiltyIdentifiers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        passwordTextField.text = ""
        passwordTextField.resignFirstResponder()
    }
    
    // MARK: - IBAction Method
    @IBAction func continueButton(_ sender: Any) {
        presenter?.continueButtonClicked(usernameTextField.text,
                                       passwordTextField.text)
    }
    
    // MARK: - Helper Methods
    
    func setUpAccessibiltyIdentifiers() {
        continueButton.accessibilityIdentifier = StringConstants.CONTINUE_BUTTON
        usernameTextField.accessibilityIdentifier = StringConstants.USERNAME_TEXTFIELD
        passwordTextField.accessibilityIdentifier = StringConstants.PASSWORD_TEXTFIELD
    }
    
    func showErrorMessage(_ message: String) {
        let alert = UIAlertController(title: StringConstants.ERROR_TITLE,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: StringConstants.OK_LABEL,
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func setupKeyboard() {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
