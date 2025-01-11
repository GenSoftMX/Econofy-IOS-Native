//
//  OnboardingInitializer.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 02/01/25.
//

import Foundation

class OnboardingInitializer: NSObject {
    //Connect with object on storyboard
    @IBOutlet weak var onboardingViewController: OnboardingViewController!

    override func awakeFromNib() {

        let configurator = OnboardingConfigurator()
        configurator.configureModuleForViewInput(viewInput: onboardingViewController)
    }
}
