//
//  HomeVC.swift
//  appNFT
//
//  Created by ALYSSON DODO on 19/04/23.
//

import UIKit

class HomeVC: UIViewController {

    private var homeScreen: HomeScreen?
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  

}
