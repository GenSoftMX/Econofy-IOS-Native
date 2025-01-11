//
//  OnboardingRouter.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 02/01/25.
//

import UIKit

class OnboardingRouter: Routable, OnboardingRouterInput {
    var viewController: OnboardingViewController!
    
    func navigateToLogin() {
        _ = makeViewController(identifier: AuthenticationViewController.storyboardIdentifier, type: AuthenticationViewController.self, in:.authentication)

    }
    
    
}
