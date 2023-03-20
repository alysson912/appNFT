//
//  ViewController.swift
//  appNFT
//
//  Created by ALYSSON DODO on 20/03/23.
//

import UIKit

class ViewController: UIViewController {

    var screen: HomeScreen?
    
    
    override func loadView() {
        screen = HomeScreen()
         view = screen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }


}

