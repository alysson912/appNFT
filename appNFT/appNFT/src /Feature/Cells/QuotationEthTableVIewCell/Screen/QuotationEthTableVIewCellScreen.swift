//
//  QuotationEthTableVIewCellScreen.swift
//  appNFT
//
//  Created by ALYSSON DODO on 28/04/23.
//

import UIKit

class QuotationEthTableVIewCellScreen: UIView {
    
    
    lazy var logoImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage( named: "Vector" )
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .red
        return image
    }()
    
    lazy var backGroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 58/255, green: 52/255, blue: 57/255, alpha: 1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor(red: 131/255, green: 127/255, blue: 131/255, alpha: 1).cgColor
        return view
    }()
    
    lazy var ethValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    lazy var ethValueInDollarsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var coinEthImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1)
        addViews()
        configConstraints()
    }
    
    func addViews(){
        addSubview(logoImageView)
        addSubview(backGroundView)
        backGroundView.addSubview(ethValueLabel)
        backGroundView.addSubview(ethValueInDollarsLabel)
        addSubview(coinEthImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.widthAnchor.constraint(equalToConstant: 40),
            
            backGroundView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            backGroundView.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            backGroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            backGroundView.heightAnchor.constraint(equalToConstant: 150),
            
            ethValueLabel.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 50),
            ethValueLabel.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 15),
            
            ethValueInDollarsLabel.topAnchor.constraint(equalTo: ethValueLabel.bottomAnchor, constant: 10),
            ethValueInDollarsLabel.leadingAnchor.constraint(equalTo: ethValueLabel.leadingAnchor),
            
            coinEthImageView.topAnchor.constraint(equalTo: topAnchor, constant: 36),
            coinEthImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            coinEthImageView.widthAnchor.constraint(equalToConstant: 240),
        ])
    }
}
