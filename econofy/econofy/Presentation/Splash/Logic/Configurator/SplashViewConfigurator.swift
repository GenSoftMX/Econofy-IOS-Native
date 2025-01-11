//
//  MainViewConfigurator.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 03/01/25.
//

import Foundation
import UIKit

class SplashViewModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? SplashViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SplashViewController) {

        let router = SplashViewRouter()
        router.viewController = viewController

        let presenter = SplashViewPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SplashViewInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
