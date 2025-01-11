//
//  MainViewInitializer.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 03/01/25.
//

import UIKit

class SplashViewModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var splashViewController: SplashViewController!

    override func awakeFromNib() {

        let configurator = SplashViewModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: splashViewController)
    }
}
