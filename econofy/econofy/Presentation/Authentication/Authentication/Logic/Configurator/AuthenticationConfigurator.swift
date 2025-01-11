//
//  AuthenticationConfigurator.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 06/01/25.
//
class AuthenticationModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? AuthenticationViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: AuthenticationViewController) {
        
        let router = AuthenticationRouter()
        router.viewController = viewController
        
        let presenter = AuthenticationPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = AuthenticationInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
    }
}
