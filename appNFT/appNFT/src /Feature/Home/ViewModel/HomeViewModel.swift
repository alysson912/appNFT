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
    
    weak private var delegate: HomeViewModelDelegate?
    
    public func delegate( delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFetch: TypeFetch){
        
        switch typeFetch {
        case .mock:
            service.getHomeFromJson { result, faiule in
                if let result {
                    print("succes")
                    self.nftData = result
                    self.delegate?.sucess()
                } else {
                    print(faiule as Any)
                    self.delegate?.error()
                }
            }
        case .request:
            service.getHome { result, faiule in
                if let result {
                    print("succes")
                    self.nftData = result
                    self.delegate?.sucess()
                } else {
                    print(faiule as Any)
                    self.delegate?.error()
                }
            }
        }
        
        
        
    }
}
