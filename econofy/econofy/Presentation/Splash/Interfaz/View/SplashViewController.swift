//
//  ViewController.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 02/01/25.
//

import UIKit
import CustomUI
import SnapKit

class SplashViewController: UIViewController {
    
    lazy var  econofyImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = AppImages.econofy
        
        imageView.contentMode = .scaleToFill

        return imageView
    }()
    
    lazy var  econofyTittleLabel: UILabel = {
        let label = UILabel()
        
        label.text =  LocalizedKeys.MainView.econofy
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        label.textColor = AppColors.PrimaryColor
                 
        return label
    }()

    var output: SplashViewControllerOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        output.viewIsReady()
    }
    
   func setupView(){
        view.addSubview(econofyImage)
        view.addSubview(econofyTittleLabel)
       
       econofyImage.snp.makeConstraints { make in
           make.height.equalTo(177)
           make.width.equalTo(177)
           make.centerX.equalToSuperview()
           make.centerY.equalToSuperview()
       }
       
       econofyTittleLabel.snp.makeConstraints { make in
           make.top.equalTo(econofyImage.snp.bottom).offset(10)
           make.centerX.equalToSuperview()
       }
    }
}

extension SplashViewController: SplashViewControllerInput {
    
}
