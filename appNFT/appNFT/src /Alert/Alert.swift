//
//  Alert.swift
//  appNFT
//
//  Created by ALYSSON DODO on 19/04/23.
//

import UIKit

class AlertController {

    var controller:  UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, message: String, completion: (() -> Void)? = nil){// o retorno pode existir ou n  (optional) 
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .cancel){ share in
            completion?()
        }
        alertController.addAction(ok)
        self.controller.present(alertController, animated:  true)
    }
}
