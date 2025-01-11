//
//  AuthenticationInitializer.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 06/01/25.
//
import UIKit

class AuthenticationModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var authenticationViewController: AuthenticationViewController!

    override func awakeFromNib() {

        let configurator = AuthenticationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: authenticationViewController)
    }
}
