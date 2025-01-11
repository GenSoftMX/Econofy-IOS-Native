//
//  MainRouter.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 03/01/25.
//

import UIKit


class SplashViewRouter:Routable, SplashViewRouterInput {
    var viewController: SplashViewController!
    
    func navigateToOnboarding() {
        _ = makeViewController(identifier: OnboardingViewController.storyboardIdentifier, type: OnboardingViewController.self, in:.splash)
    }
    
    func navigateToLogin() {
        _ = makeViewController(identifier: AuthenticationViewController.storyboardIdentifier, type: AuthenticationViewController.self, in:.authentication)
    }
    
}
