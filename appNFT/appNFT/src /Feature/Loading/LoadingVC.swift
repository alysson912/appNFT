//
//  LoadingVC.swift
//  appNFT
//
//  Created by ALYSSON DODO on 18/05/23.
//

import UIKit

class LoadingVC: UIViewController {
    
    var viewModel: LoadingViewModel = LoadingViewModel()
    var  screen: LoadingScreen?
    
    override func loadView() {
        screen = LoadingScreen()
        view = screen
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
        

       
}
