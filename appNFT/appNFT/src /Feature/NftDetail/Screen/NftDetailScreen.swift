//
//  NftDetailScreen.swift
//  appNFT
//
//  Created by ALYSSON DODO on 25/04/23.
//

import UIKit

class NftDetailScreen: UIView {
    


    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none // retirando linhas
        // TO DO: Register
        tableView.register(NftImageTableViewCell.self, forCellReuseIdentifier: NftImageTableViewCell.identifier)
        tableView.register(NftDescriptionTableViewCell.self, forCellReuseIdentifier: NftDescriptionTableViewCell.identifier)
        
        tableView.register(LastestDealTableViewCell.self, forCellReuseIdentifier: LastestDealTableViewCell.identifier)
        
        tableView.backgroundColor =  UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return tableView
    }()
    
 

    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        configConstraints()
    }
    
    private func addView(){
        addSubview(tableView)
    }
    
    // config protocols
   public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
    
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
