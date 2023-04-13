//
//  ViewController.swift
//  appNFT
//
//  Created by ALYSSON DODO on 20/03/23.
//

import UIKit

class LoginVC: UIViewController {

    var screen: LoginScreen?
    

    override func loadView() {
        screen = LoginScreen()
         view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        screen?.delegate(delegate: self)
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
