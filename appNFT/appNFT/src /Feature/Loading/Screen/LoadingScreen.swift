//
//  LoadingScreen.swift
//  appNFT
//
//  Created by ALYSSON DODO on 18/05/23.
//

import UIKit
import Lottie

class LoadingScreen: UIView {


    
//    public func animationIsHidden(condition : Bool){
   //     animationView.isHidden = condition
 //   }
    
    lazy var animationView: LottieAnimationView = {
        var animation = LottieAnimationView()
        animation = .init(name: "lf20_kxsd2ytq")
        animation.contentMode = .scaleAspectFill
        animation.loopMode = .loop
        animation.animationSpeed = 1.0
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.play()
        return animation
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addViews()
        setupConstraints()
    }
    
    private func addViews(){
        addSubview(animationView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
        
            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: centerYAnchor),
            animationView.heightAnchor.constraint(equalToConstant: 150),
            animationView.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
}
