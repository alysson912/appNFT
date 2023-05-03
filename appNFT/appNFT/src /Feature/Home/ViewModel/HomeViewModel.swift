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
                 //   print(faiule as Any)
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
                 //   print(faiule as Any)
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
    
    var typeFilter: Int? {
        return searchNftData?.filterListNft?.first(where: {$0.isSelected == true})?.id
    }
    public func filterSearchText(_ text: String){
        
        var nftList: [Nft] = []
        
        if typeFilter == 0 /* 0 = todos os itens */ {
            nftList = nftData?.nftList ?? [] // retorne a lista completa
        } else {
            nftList = nftData?.nftList?.filter({$0.type == typeFilter ?? 0}) ?? []
        }
        
        if text.isEmpty {
            searchNftData?.nftList = nftList // search vazia = exiba doto mundo
        }else {
            searchNftData?.nftList = nftList.filter({ nft in // filtrando pelo user name (em lowerCased)
        
                // validacoes adicionais aqui -> 
                return nft.userName?.lowercased().contains(text.lowercased()) ?? false //pegando o q o usuario digitou em caixa alta p/ caixa baixa
            })
        }
    }
    
    // MARK: -  Filter CollectionView, lofica para mudar a cor do item selecionado na collection
    
    public func setFilter(indexPath: IndexPath, searchText: String){
        var filterNFT: [FilterNft] = []
        for (index, value) in (searchNftData?.filterListNft ?? []).enumerated() {
            var type = value
            if index == indexPath.row {
                type.isSelected = true
            }else{
                type.isSelected = false
            }
            filterNFT.append(type)
        }
        searchNftData?.filterListNft = filterNFT
        filterSearchText(searchText)
    }
}
