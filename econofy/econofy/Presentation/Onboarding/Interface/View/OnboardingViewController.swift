//
//  OnboardingViewController.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 02/01/25.
//

import Foundation
import UIKit
import CustomUI

class OnboardingViewController: UIViewController, OnboardingViewInput {
 
    var output: OnboardingViewOutput!
    
    var currentIndex: Int = 0
    
    let onboardingData: [OnboardingModel] = OnboardingModel.data
    
    
    let imageViewContainer: UIView = {
        var container = UIView()
        container.isOpaque = true
        return container
    }()

    lazy var image: UIImageView = {
        var image = UIImageView()
       
        image.contentMode = .center
        
        return image
    }()
    
    lazy var titleComponent: OnboardingTitleView = {
        var coponent = OnboardingTitleView()
    
        return coponent
    }()
    
    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = AppColors.LightBlueGrayColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var nextButton :UIButton = {
        var button = UIButton()
        
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor(hex: "#C8D2DE"), for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)

        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.backgroundColor = AppColors.Transparent
        
        return button
    }()

    private lazy var prevButton :UIButton = {
        var button = UIButton()
        
        button.setTitle("Prev", for: .normal)
        button.setTitleColor(AppColors.GrayScale50Color, for: .normal)
        button.addTarget(self, action: #selector(prevButtonTapped), for: .touchUpInside)

        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.backgroundColor = AppColors.Transparent
        
        return button
    }()
    
    private lazy var dotsIndicator: CustomDotsIndicator = {
        let dotsIndicator = CustomDotsIndicator()
        
        dotsIndicator.dotSpacing = 10.0
 
        return dotsIndicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupView()
    }
    
    func setupView(){
        view.backgroundColor = AppColors.DarkBlueGrayColor
        
        view.addSubview(imageViewContainer)
        view.addSubview(titleComponent)
        view.addSubview(bodyLabel)
        view.addSubview(nextButton)
        view.addSubview(prevButton)
        
        imageViewContainer.addSubview(image)
        view.addSubview(dotsIndicator)

        imageViewContainer.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.height.equalTo(302)
            make.leading.equalToSuperview().inset(45)
            make.trailing.equalToSuperview().inset(45)
        }
        
        image.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        titleComponent.snp.makeConstraints { make in
            make.top.equalTo(imageViewContainer.snp.bottom).offset(80)
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
        }
        
        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(titleComponent.snp.bottom).offset(80)
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(bodyLabel.snp.bottom).offset(100)
            make.trailing.equalToSuperview().inset(24)
        }
        
        prevButton.snp.makeConstraints { make in
            make.top.equalTo(bodyLabel.snp.bottom).offset(100)
            make.leading.equalToSuperview().inset(24)
        }
        
        dotsIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(prevButton.snp.top)
            make.bottom.equalTo(prevButton.snp.bottom)
        }

        setData()
    }
    
    @objc private func nextButtonTapped() {
        if((currentIndex + 1) < onboardingData.count){
            currentIndex+=1
            setData()
        }else{
            output.routeToAuthenticationModule()
        }
    }
    
    @objc private func prevButtonTapped() {
        if(currentIndex > 0){
            currentIndex-=1
            setData()
        }
    }
    
    func setData(){
        image.image = onboardingData[currentIndex].asset
                
        bodyLabel.text = onboardingData[currentIndex].body
        
        titleComponent.configure(title: onboardingData[currentIndex].title, subtitle: onboardingData[currentIndex].sub, icon: onboardingData[currentIndex].icon)
        
        if(currentIndex > 0) {
            prevButton.isHidden = false
        } else {
            prevButton.isHidden = true
        }
        dotsIndicator.numberOfDots = onboardingData.count
        dotsIndicator.activeDotIndex = currentIndex
    }
    
}
