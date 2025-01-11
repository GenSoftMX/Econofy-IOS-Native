//
//  OnboardingConfigurator.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 02/01/25.
//

import Foundation

class OnboardingConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? OnboardingViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: OnboardingViewController) {
        let router = OnboardingRouter()
        router.viewController = viewController

        let presenter = OnboardingPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = OnboardingInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
