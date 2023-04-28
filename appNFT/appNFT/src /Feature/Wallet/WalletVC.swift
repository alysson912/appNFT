//
//  WalletVC.swift
//  appNFT
//
//  Created by ALYSSON DODO on 28/04/23.
//

import UIKit

class WalletVC: UIViewController {

    private var screen: WalletScreen?
    var viewModel: WalletViewModel = WalletViewModel()
    
    override func loadView() {
        screen =  WalletScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) { // ciclo de vida para esconder a navigation 
        navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetch(.request)
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
}

extension WalletVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return UITableViewCell()
    }
    
    
}
