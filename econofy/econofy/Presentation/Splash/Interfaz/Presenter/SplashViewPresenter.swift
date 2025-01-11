//
//  MainPresenter.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 03/01/25.
//

import Foundation

class SplashViewPresenter: SplashViewPresenterInput {
    
    weak var view: SplashViewControllerInput!
    var interactor: SplashInteractorInput!
    var router: SplashViewRouterInput!
    
    func viewIsReady() {
        // Execute background task with global queue
        DispatchQueue.global(qos: .background).async {
            // Perform any heavy-lifting operations here (e.g., fetching data if required)
            // No heavy logic here as it would block the background thread unnecessarily
            
            // Switch back to the main thread for UI-related actions
            DispatchQueue.main.async {
                // Decide navigation flow based on onboarding and session state
                if !Memory.shared.hasCompletedOnboarding {
                    // Adding a delay for UX purposes if needed
                    Thread.sleep(forTimeInterval: 2) // Consider replacing this with a more responsive delay mechanism
                    self.router.navigateToOnboarding()
                } else if Memory.shared.hasSession {
                    // Navigate to the home screen
                    //                    self.router.navigateToHome() // Replace with actual method if required
                    print("Navigating to home")
                } else {
                    // Navigate to the login screen
                    //                    self.router.navigateToLogin() // Replace with actual method if required
                    self.router.navigateToLogin()
                }
            }
        }
    }
}



extension SplashViewPresenter: SplashInteractorOutput {
    
}


extension SplashViewPresenter: SplashViewControllerOutput {
    func didClickOnActionButton() {
        router.navigateToOnboarding()
    }
}
