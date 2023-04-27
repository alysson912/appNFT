//
//  MagnifyingGlassScreen.swift
//  appNFT
//
//  Created by ALYSSON DODO on 27/04/23.
//

import UIKit

protocol MagnifyingGlassScreenDelegate: AnyObject {
    func tappedBackButton()
}

class MagnifyingGlassScreen: UIView {

    private weak var delegate: MagnifyingGlassScreenDelegate?
    
    public func delegate(delegate: MagnifyingGlassScreenDelegate?){
        self.delegate = delegate
    }
    
    
    lazy var nftImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1.0)
        return image
    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
       // btn.setTitle("Calcular", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1.0)
        btn.setImage(UIImage(systemName: "arrowshape.turn.up.backward.fill"), for: .normal)
        btn.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedBackButton(){
        delegate?.tappedBackButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addViews()
        configConstraints()
    }
    
    func addViews(){
        addSubview(nftImageView)
        addSubview(backButton)
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
            
            
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            backButton.widthAnchor.constraint(equalToConstant: 35),
            
        ])
    }
}
