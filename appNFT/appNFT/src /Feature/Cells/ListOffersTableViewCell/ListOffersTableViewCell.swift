//
//  ListOffersTableViewCell.swift
//  appNFT
//
//  Created by ALYSSON DODO on 27/04/23.
//

import UIKit
import AlamofireImage

class ListOffersTableViewCell: UITableViewCell {

    
    static let identifier: String = String( describing: ListOffersTableViewCell.self)
    
    private lazy var screen: ListOffersTableViewCellScreen = {
        let view = ListOffersTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private  func addViews(){
        contentView.addSubview(screen)
    }
    
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    // setup cells
    
    public func setupCell(data: LatestDeal, isInitial: Bool, isFinal: Bool){
        if let url = URL(string: data.userImage ?? ""){
            screen.userImageView.af.setImage(withURL: url, placeholderImage: UIImage(systemName: "person.circle.fill")?.withTintColor(.black))
            
        }
        screen.layer.borderColor = UIColor.white.cgColor
        screen.layer.borderWidth = 0.5
        screen.nameUserLabel.text = data.userName ?? ""
        screen.nftPriceLabel.text = "\(data.nftPrice ?? 0 ) ETH "
        screen.lastVisualizationLabel.text = data.lastAccess ?? ""
        
        if isInitial {
            screen.roundCorners(cornerRadiuns: 20, typeCorners: [.topLeft, .topRight])
        }
        
        if isFinal {
            screen.roundCorners(cornerRadiuns: 20, typeCorners: [.bottomLeft, .bottomRight])
        }
    }
}
