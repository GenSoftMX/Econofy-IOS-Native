//
//  OnboardingPresenter.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 02/01/25.
//

import Foundation

class OnboardingPresenter: OnboardingPresenterInput {
    weak var view: OnboardingViewInput!
    var interactor: OnboardingInteractorInput!
    var router: OnboardingRouterInput!
    
    func viewIsReady() {
        //    TODO:
    }
}

extension OnboardingPresenter: OnboardingViewOutput {
    func routeToAuthenticationModule() {
        Memory.shared.hasCompletedOnboarding = true
        
        router.navigateToLogin()
    }
}

extension OnboardingPresenter: OnboardingInteractorOutput {
//    TODO:
}
