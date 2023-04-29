//
//  WalletVC.swift
//  appNFT
//
//  Created by ALYSSON DODO on 28/04/23.
//

import UIKit

enum WalletNameCell: Int {
    case quotationEth = 1
}

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
        viewModel.delegate(delegate: self)
        viewModel.fetch(.request)
    }
    
}

extension WalletVC: WalletViewModelDelegate {
    func sucess() {
        DispatchQueue.main.async {
            self.screen?.configTableViewProtocols(delegate: self, dataSource: self)
            self.screen?.tableView.reloadData()
        }
        
    }
    
    func error() {
        print(#function)
    }
    
    
}

extension WalletVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: QuotationEthTableViewCell.identifier, for: indexPath) as? QuotationEthTableViewCell
        
        cell?.setupCell(data: viewModel.loadCurrentQuotationEthereum(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
}
