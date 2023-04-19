//
//  ViewController.swift
//  appNFT
//
//  Created by ALYSSON DODO on 20/03/23.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    var loginScreen: LoginScreen?
    var auth: Auth?

    override func loadView() {
        loginScreen = LoginScreen()
         view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        auth = Auth.auth()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
        isEnableLoginButton(false)
    }

    func validateTextFields(){
        if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) &&
        (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password){
            // habiltado
            isEnableLoginButton(true)
        }else {
            // desable
            isEnableLoginButton(false)
        }
            
    }
    
    func isEnableLoginButton(_ isEnable: Bool){
        if isEnable {
            loginScreen?.loginButton.setTitleColor(.white, for: .normal)
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButton.alpha = 1
            
        }else {
            loginScreen?.loginButton.setTitleColor(.white, for: .normal)
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.loginButton.alpha = 0.4
        }
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
        validateTextFields()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
    }
}

extension LoginVC: loginScreenProtocol {
    func tappedLoginButton() {
        auth?.signIn(withEmail: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "", completion: { user, error in
            if error != nil {// error
                print(error?.localizedDescription ?? "")
            }else{// succes
                print("Sucesso")
            }
        })
    }
    
    func tappedRegisterButton() { // falta implementar
        print(#function)
    }

}
