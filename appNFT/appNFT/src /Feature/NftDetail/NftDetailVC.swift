//
//  NftDetailVC.swift
//  appNFT
//
//  Created by ALYSSON DODO on 25/04/23.
//

import UIKit

enum NameCellNftDetail: Int {
    case nftImage = 0
    case description = 1
}

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
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch NameCellNftDetail(rawValue: indexPath.row) {
            
        case .nftImage:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftImageTableViewCell.identifier, for: indexPath) as?
            NftImageTableViewCell
            cell?.setupCell(urlImage: viewModel.nftImage, delegate: self)
            return  cell ??  UITableViewCell()
            
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftDescriptionTableViewCell.identifier, for: indexPath) as?
            NftDescriptionTableViewCell
            cell?.setupCell(id: viewModel.idNft, title: viewModel.titleNft, description: viewModel.descriptionNft)
            return  cell ??  UITableViewCell()
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  400
    }
}
extension NftDetailVC: NftImageTableViewCellScreenDelegate {
    func tappedCloseButton() {
        dismiss(animated: true)
    }
    
    func tappedMagnifyingGlassButtonButton() {
        print(#function)
    }
    
    
}
