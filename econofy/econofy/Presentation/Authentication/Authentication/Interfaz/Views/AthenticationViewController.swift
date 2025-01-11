//
//  LoginViewController.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 06/01/25.
//

import UIKit
import CustomUI

class AuthenticationViewController: UIViewController {
    var output: AuthenticationViewControllerOutput!
          
    private lazy var containerLogoView: UIView = {
        var view = UIView()
        
        view.backgroundColor = AppColors.Primary100Color
        view.layer.cornerRadius = 25
        
        return view
    }()
    
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = AppImages.Authentication.authenticate
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Sign In"
        label.font = UIFont.Poppins.customFont(size: 32, style: .semiBold)
//            .systemFont(ofSize: 32, weight: .semibold)
        label.textColor = AppColors.PrimaryColor
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum."
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = AppColors.GrayScale700Color
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    
    private lazy var facebookButton: SocialProviderButton = {
        let button = SocialProviderButton()
       
        button.configure(with: "Facebook", icon: AppImages.SocialProviders.facebook, backgroundColor: AppColors.GrayScale50Color)
        
        return button
    }()
    
    private lazy var googleButton: SocialProviderButton = {
        let button = SocialProviderButton()
            
        button.configure(with: "Google", icon: AppImages.SocialProviders.google, backgroundColor: AppColors.GrayScale50Color)
        
        return button
    }()
    
    private lazy var socialProviderStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [facebookButton, googleButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var horizontalDivisionLine: CustomHorizontalLineDivider = {
        var line = CustomHorizontalLineDivider()
        return line
    }()

    private lazy var emailOrPhoneTextField: CustomTextField = {
       var textField = CustomTextField()
       
        textField.backgroundColor = AppColors.InputFilledColor
        textField.configure(placeHolder: "Email/Phone Number")
        
        return textField
    }()
    
    
    private lazy var passwordTextField: PasswordTextField = {
        var textField = PasswordTextField()
        
        textField.setTitle(title: "Password")        

        return textField
    }()
    
    private lazy var loginButton: CustomButton = {
        var button = CustomButton()
        button.setTitle(title: "Login", font: .systemFont(ofSize: 16, weight: .medium), color: .white)
        button.backgroundColor = AppColors.PrimaryColor
        button.layer.cornerRadius = 20
        
        return button
    }()

    private lazy var fotgotPasswordButton :UIButton = {
        var button = UIButton()
        
        button.setTitle("Forget Password?", for: .normal)
        button.setTitleColor(AppColors.GrayScale700Color, for: .normal)
        button.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)

        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        return button
    }()

    private lazy var haveAccountButton :UIButton = {
        var button = UIButton()
      
        let attributedString = NSMutableAttributedString()
        
        // Añadir texto al subtítulo
        let titleString = NSAttributedString(string: "Do you have account? ", attributes: [
            .foregroundColor: AppColors.GrayScale500Color.cgColor,
            .font: UIFont.systemFont(ofSize: 14, weight: .regular)
        ])
        attributedString.append(titleString)
        
        // Añadir texto al subtítulo
        let signUpString = NSAttributedString(string: " Sign In", attributes: [
            .foregroundColor:AppColors.PrimaryColor.cgColor,
            .font: UIFont.systemFont(ofSize: 14, weight: .regular)
        ])
        
        attributedString.append(signUpString)

        button.setAttributedTitle(attributedString, for: .normal)

        button.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailOrPhoneTextField.onChange = { text in
            print("Text changed: \(text)")
        }
        
        passwordTextField.onChange = { text in
            print("Text changed: \(text)")
        }
        
        view.addSubview(containerLogoView)
        
        containerLogoView.addSubview(logoImage)
        
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(socialProviderStackView)
        view.addSubview(horizontalDivisionLine)
        view.addSubview(emailOrPhoneTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(fotgotPasswordButton)
        view.addSubview(haveAccountButton)
        
        horizontalDivisionLine.configure(with: "Or", lineBackgroundColor: UIColor(hex: "#E0E5EC"))
        
        containerLogoView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(45)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(90)
        }
        
        logoImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(70)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerLogoView.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(24)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.centerX.equalToSuperview()
        }
        
        socialProviderStackView.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(24)
            make.height.equalTo(56)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        horizontalDivisionLine.snp.makeConstraints { make in
            make.top.equalTo(socialProviderStackView.snp.bottom).offset(16)
            make.height.equalTo(22)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        emailOrPhoneTextField.snp.makeConstraints { make in
            make.top.equalTo(horizontalDivisionLine.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailOrPhoneTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
        
        fotgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(5)
            make.trailing.equalToSuperview().inset(24)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(fotgotPasswordButton.snp.bottom).offset(22)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
        
        haveAccountButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(24)
        }
        
        
    }
    
    @objc private func didTapForgotPasswordButton(){
        print("didTapForgotPasswordButton")
        
    }
}

extension AuthenticationViewController: AuthenticationViewControllerInput {
    
}

