//
//  NftDetailViewModel.swift
//  appNFT
//
//  Created by ALYSSON DODO on 25/04/23.
//

import Foundation
import UIKit

class NftDetailViewModel {
    
    
    private let nft: Nft
    
    init(nft: Nft) {
        self.nft = nft
    }
    
    public var numberOfRowsInSection: Int {
        return 3
    }
    
    public var nftImage: String {
        return nft.nftImage ?? ""
    }
    
    public var idNft: Int {
        return nft.nftID ?? 0
    }
    
    public var titleNft: String {
        return nft.nftNameImage ?? ""
    }
    
    public var nftDescription: String {
        return nft.nftDescription ?? ""
    }
    
    public var getNft: Nft {
        return nft
    }
    
    public func heightForRowAt (indexPath: IndexPath, width: CGFloat) -> CGFloat{
        switch NameCellNftDetail(rawValue: indexPath.row) {
            
        case .nftImage:
            return 400
        case .description:
         
            return nftDescription.height(withConstrainedWidth: width - 40, font: UIFont.systemFont(ofSize: 18)) + 89
        case .lastestDeal:
            return 400
            
        default:
            return 0
        }
    }
  
}
