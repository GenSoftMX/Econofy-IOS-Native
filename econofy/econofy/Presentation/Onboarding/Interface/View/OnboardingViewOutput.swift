//
//  OnboardingViewOutput.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 02/01/25.
//

import Foundation

protocol OnboardingViewOutput: AnyObject {
    
    /**
     Setup initial state of the view
     */
    
    func viewIsReady()
    
    func routeToAuthenticationModule()
}
