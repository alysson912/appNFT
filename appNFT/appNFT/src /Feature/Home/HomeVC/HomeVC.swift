//
//  HomeVC.swift
//  appNFT
//
//  Created by ALYSSON DODO on 19/04/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen: HomeScreen?
    var viewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configSearchBarDelegate(delegate: self)
        viewModel.delegate(delegate: self)
        viewModel.fetchRequest(.request)
        
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NftFilterCollectionViewCell.identifier, for: indexPath) as? NftFilterCollectionViewCell
        
        cell?.setupCell(filter: viewModel.loadCurrentFilterNft(indexPath: indexPath))
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItemAt
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.setFilter(indexPath: indexPath, searchText: screen?.searchBar.text ?? "")
        screen?.collectionView.reloadData()
        screen?.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        screen?.tableView.reloadData()
        if viewModel.numberOfRowsInSection > 0 {
            screen?.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
}

extension HomeVC: HomeViewModelDelegate {
    func sucess() {
        DispatchQueue.main.async {
            self.screen?.configCollectionViewProtocols(delegate: self, dataSource: self)
            self.screen?.configTableViewProtocols(delegate: self, dataSource: self)
            self.screen?.tableView.reloadData()
        }
        
    }
    
    func error() {
        print(#function)
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NftTableViewCell.identifier,for: indexPath ) as? NftTableViewCell
        cell?.setupCell(data: viewModel.loadCurrentNft(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nftDetail = NftDetailVC(nft: viewModel.loadCurrentNft(indexPath: indexPath))
        present(nftDetail, animated: true)
    }
    
}

extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) { // qualquer caractere alterado na search sera disparado
        
        viewModel.filterSearchText(searchText)
        screen?.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { // quando precionar buscar
        searchBar.resignFirstResponder()
    }
}
