//
//  HomeScreen.swift
//  appNFT
//
//  Created by ALYSSON DODO on 20/03/23.
//

import UIKit

protocol loginScreenProtocol: AnyObject {
    func tappedLoginButton()
    func tappedRegisterButton()
}

class LoginScreen: UIView {

    private weak var delegate: loginScreenProtocol?
    
    public func delegate(delegate: loginScreenProtocol?){
        self.delegate = delegate
    }
    
    
    lazy var subImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage( named: "BGLogin" )
        image.contentMode = .scaleAspectFill
        return image
    }()
   
    lazy var logoAppImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage( named: "BFLogin" )
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .red
        return image
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BF NFT!"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O marketplace de NFTs da Back Front Academy!"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress // defaut
        tf.attributedPlaceholder = NSAttributedString(string: "E-mail: user@outlook.com", attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)]) // cor customizada
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        
        tf.text = "almenezes912@gmail.com"
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress // defaut
        tf.attributedPlaceholder = NSAttributedString(string: "password:", attributes: [ NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)]) // cor customizada
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.isSecureTextEntry = true
        tf.text = "9Alysson12"
        return tf
    }()
    
    lazy var recoverPaasswordButton: UIButton = {
        let btn = UIButton( type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Esqueceu a senha?", for: .normal)
        btn.setTitleColor(UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1.0), for: .normal)
        btn.addTarget(self, action: #selector(tappedRecoverPasswprdButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitle("Entrar", for: .normal)
        btn.setBackgroundImage(UIImage( named: "gradient3"), for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    func configTextFieldDelegate( delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }

    @objc func tappedLoginButton(_ sender: UIButton){
     //   print(#function)
        delegate?.tappedLoginButton()
    }
    @objc func tappedRecoverPasswprdButton(_ sender: UIButton){
     //   print(#function)
    }
    
    
    
    
    lazy var signInMetamaskView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 2
       return view
    }()
    
    lazy var signInMetamaskImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage( named: "logo" )
        return image
    }()
    
    lazy var signInMetamaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Entrar com a Metamask"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        addSubview(subImageView)
        addSubview(logoAppImageView)
        addSubview(loginLabel)
        addSubview(descriptionLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(recoverPaasswordButton)
        addSubview(loginButton)
        addSubview(lineView)
        addSubview(signInMetamaskView)
        signInMetamaskView.addSubview(signInMetamaskImageView)
        signInMetamaskView.addSubview(signInMetamaskLabel)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            subImageView.topAnchor.constraint(equalTo: topAnchor),
            subImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoAppImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 55),
            logoAppImageView.heightAnchor.constraint(equalToConstant: 108),
            logoAppImageView.widthAnchor.constraint(equalToConstant: 108),
        
           
            loginLabel.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 16),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor ),
            emailTextField.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
        
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 11),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            recoverPaasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 9),
            recoverPaasswordButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            recoverPaasswordButton.heightAnchor.constraint(equalToConstant: 16),
            
            loginButton.topAnchor.constraint(equalTo: recoverPaasswordButton.bottomAnchor, constant: 36),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 43 ),
            
            lineView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 48),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            signInMetamaskView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 48),
            signInMetamaskView.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            signInMetamaskView.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            signInMetamaskView.heightAnchor.constraint(equalToConstant: 41),
            
            signInMetamaskImageView.leadingAnchor.constraint(equalTo: signInMetamaskView.leadingAnchor, constant: 53),
            signInMetamaskImageView.centerYAnchor.constraint(equalTo: signInMetamaskView.centerYAnchor),
            signInMetamaskImageView.heightAnchor.constraint(equalToConstant: 20),
            signInMetamaskImageView.widthAnchor.constraint(equalToConstant: 20),
            
            
            signInMetamaskLabel.leadingAnchor.constraint(equalTo: signInMetamaskImageView.trailingAnchor, constant: 17),
            signInMetamaskLabel.centerYAnchor.constraint(equalTo: signInMetamaskView.centerYAnchor),
        ])
    }
}
