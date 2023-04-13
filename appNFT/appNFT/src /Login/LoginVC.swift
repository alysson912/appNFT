//
//  ViewController.swift
//  appNFT
//
//  Created by ALYSSON DODO on 20/03/23.
//

import UIKit

class LoginVC: UIViewController {

    var loginScreen: LoginScreen?
    

    override func loadView() {
        loginScreen = LoginScreen()
         view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        dismissKeyboard()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
    }


}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email: String = loginScreen?.emailTextField.text ?? ""
        let password: String = loginScreen?.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButton.backgroundColor = .darkGray
        } else {
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.loginButton.backgroundColor = .darkGray.withAlphaComponent(0.6)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
    }
}

extension LoginVC: loginScreenProtocol {
    func tappedLoginButton() {
        print(#function)
    }
    
    func tappedRegisterButton() { // falta implementar
        print(#function)
    }

}
