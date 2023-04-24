//
//  HomeViewModel.swift
//  appNFT
//
//  Created by ALYSSON DODO on 20/04/23.
//

import UIKit

protocol  HomeViewModelDelegate: AnyObject {
    func sucess()
    func error()
}

class HomeViewModel{
    
    private let service: HomeService = HomeService()
    private var nftData: NFTData?
    private var searchNftData: NFTData?
    
    weak private var delegate: HomeViewModelDelegate?
    
    public func delegate( delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFetch: TypeFetch){
        
        switch typeFetch {
        case .mock:
            service.getHomeFromJson { result, faiule in
                if let result {
                 
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.sucess()
                } else {
                    print(faiule as Any)
                    self.delegate?.error()
                }
            }
        case .request:
            service.getHome { result, faiule in
                if let result {
         
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.sucess()
                } else {
                    print(faiule as Any)
                    self.delegate?.error()
                }
            }
        }
    }
    
    //MARK: FILTER COLLECTIONVIEW
    
    public  var numberOfItemsInSection: Int {
        return searchNftData?.filterListNft?.count ?? 0 // qtd de elementos, caso o contrario retorne 0
    }
    
    public   func loadCurrentFilterNft(indexPath: IndexPath) -> FilterNft {
        return searchNftData?.filterListNft?[indexPath.row] ?? FilterNft()
    }
    
    public  var sizeForItemAt: CGSize {
        return CGSize(width: 100, height: 34)
    }
    // MARK: - nft tableViewCell
    
    public var numberOfRowsInSection: Int {
        return searchNftData?.nftList?.count  ?? 0
    }
    
    public   func loadCurrentNft(indexPath: IndexPath) -> Nft {
        return searchNftData?.nftList?[indexPath.row] ?? Nft()
    }
    
    public var heightForRowAt: CGFloat {
        return 360
    }
    // MARK: -  Filter Search
    public func filterSearchText(_ text: String){
        if text.isEmpty {
            searchNftData?.nftList = nftData?.nftList // search vazia = exiba doto mundo
        }
        searchNftData?.nftList = nftData?.nftList?.filter({ nft in // filtrando pelo user name (em lowerCased)
            
            // validacoes adicionais aqui -> 
            return nft.userName?.lowercased().contains(text.lowercased()) ?? false //pegando o q o usuario digitou em caixa alta p/ caixa baixa
        })
    }
    
    
    
}
