//
//  AuthenticationPresenter.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 06/01/25.
//

import Foundation


class AuthenticationPresenter: AuthenticationPresenterInput {
    
    weak var view: AuthenticationViewControllerInput!
    var interactor: AuthenticationInteractorInput!
    var router: AuthenticationRouterInput!
}


extension AuthenticationPresenter: AuthenticationViewControllerOutput {
    
}

extension AuthenticationPresenter: AuthenticationInteractorOutput {
    
}
