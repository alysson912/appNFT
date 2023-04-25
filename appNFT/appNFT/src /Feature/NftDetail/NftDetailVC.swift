//
//  NftDetailVC.swift
//  appNFT
//
//  Created by ALYSSON DODO on 25/04/23.
//

import UIKit

class NftDetailVC: UIViewController {

    let viewModel: NftDetailViewModel
    private var screen : NftDetailScreen?
    
    
    override func loadView() {
        screen = NftDetailScreen()
        view = screen
    }
    
    required init(nft: Nft) {
        viewModel = NftDetailViewModel(nft: nft)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    

}
extension NftDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        
        return  UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return  0
    }
}
