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
        
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
            case loginScreen?.emailTextField:
                if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email){
                    loginScreen?.emailTextField.layer.borderWidth = 1
                    loginScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                }else{
                    loginScreen?.emailTextField.layer.borderWidth = 1.5
                    loginScreen?.emailTextField.layer.borderColor = UIColor.red.cgColor
                }
            case loginScreen?.passwordTextField:
                if (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password){
                    loginScreen?.passwordTextField.layer.borderWidth = 1
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
                }else{
                    loginScreen?.passwordTextField.layer.borderWidth = 1.5
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            default:
                break
            }
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
