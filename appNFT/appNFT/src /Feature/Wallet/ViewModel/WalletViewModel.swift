//
//  WalletViewModel.swift
//  appNFT
//
//  Created by ALYSSON DODO on 28/04/23.
//

import UIKit
protocol  WalletViewModelDelegate: AnyObject {
    func sucess()
    func error()
}


class WalletViewModel{
    
    private let service: WalletService = WalletService()
    private var delegate: WalletViewModelDelegate?
    private var walletData: WalletData?
    
    public func delegate(delegate: WalletViewModelDelegate?){
        self.delegate = delegate
    }
    
    
    public func fetch(_ type: TypeFetch){
        switch type {
        case .mock:
            service.getWalletFromJson { result, failure in
                if let result{
                    self.walletData = result
                    self.delegate?.sucess()
                } else {
                    self.delegate?.error()
                }
                
            }
        case .request:
            service.getWallet { result, failure in
                self.walletData = result
                if let result{
                    self.walletData = result
                    self.delegate?.sucess()
                } else {
                    self.delegate?.error()
                }
            }
        }
    }
    var numberOfRowsInSection: Int {
        return 2
    }
    
    public var quotationEthereum: QuotationEthereum {
        return walletData?.quotationEthereum ?? QuotationEthereum()
        
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        switch WalletNameCell(rawValue: indexPath.row) {
        case .quotationEth:
            return 250
        case .transactionList:
            return HeightLatestTransactions.height.rawValue * CGFloat(walletData?.latestTransactionsCell?.listOfTransactions?.count ?? 0) + 75
        default:
            return 0
        }
    }
    public var latestTransactionsCell: LatestTransactionsCell {
        return walletData?.latestTransactionsCell ?? LatestTransactionsCell()
        
    }
}
