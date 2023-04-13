//
//  UIViewController+Extension.swift
//  appNFT
//
//  Created by ALYSSON DODO on 12/04/23.
//

import Foundation
import UIKit
// feature clicar em qualquer lugar na tela, o teclado baixar
extension UIViewController {
    func dismissKeyboard(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
