//
//  NftImageTableViewCellScreen.swift
//  appNFT
//
//  Created by ALYSSON DODO on 25/04/23.
//

import UIKit

protocol NftImageTableViewCellScreenDelegate: AnyObject {
    func tappedCloseButton()
    func tappedMagnifyingGlassButtonButton()
}

class NftImageTableViewCellScreen: UIView {
    
    static  let identifier: String =  String(describing: NftImageTableViewCellScreen.self)
    
    private var delegate: NftImageTableViewCellScreenDelegate?
    
    public func delegate(delegate: NftImageTableViewCellScreenDelegate?){
        self.delegate = delegate
    }
    
    lazy var nftImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.tintColor = .white
        return imageView
    }()
    
    lazy var closeButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.tintColor = .white
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1.0)
        btn.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedCloseButton(){
        delegate?.tappedCloseButton()
    }
    
    
    lazy var magnifyingGlassButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.tintColor = .white
        btn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        btn.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1.0)
        btn.addTarget(self, action: #selector(tappedMagnifyingGlassButtonButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedMagnifyingGlassButtonButton(){
        delegate?.tappedMagnifyingGlassButtonButton()
    }
    
    
    private func addViews(){
        addSubview(nftImageView)
        addSubview(closeButton)
        addSubview(magnifyingGlassButton)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            nftImageView.topAnchor.constraint(equalTo: topAnchor),
            nftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nftImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            closeButton.topAnchor.constraint(equalTo: nftImageView.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 35),
            closeButton.widthAnchor.constraint(equalToConstant: 35),
            
            magnifyingGlassButton.bottomAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: -30),
            magnifyingGlassButton.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor, constant: -20),
            magnifyingGlassButton.heightAnchor.constraint(equalToConstant: 35),
            magnifyingGlassButton.widthAnchor.constraint(equalToConstant: 35),
            
            
        ])
    }
    
}
