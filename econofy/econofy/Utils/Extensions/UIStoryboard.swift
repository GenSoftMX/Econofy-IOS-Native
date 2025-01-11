//
//  UIStoryboard.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 03/01/25.
//

import UIKit

extension UIStoryboard {

    enum Storyboard: String {
        case splash, authentication, settings // Agrega más casos según sea necesario
        
        var filename: String {
                  let firstLetter = rawValue.prefix(1)
                  let camelCaseStoryboardName = firstLetter.uppercased() + rawValue.suffix(rawValue.count - 1)
                  return camelCaseStoryboardName
              }
    }

    // MARK: - Class Functions
    /**
     Crea y devuelve un objeto `UIStoryboard` para el storyboard especificado.
     Utiliza el valor del enum con la primera letra en mayúsculas como identificador.
     ### Ejemplo de uso: ###
     ````
     UIStoryboard.storyboard(.main)
     ````
     */
    static func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }

    static func instantiateInitialViewController(of storyboard: Storyboard, bundle: Bundle? = nil) -> UIViewController? {
        let storyBoard = UIStoryboard.storyboard(storyboard, bundle: bundle)
        return storyBoard.instantiateInitialViewController()
    }
}

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UIViewController: StoryboardIdentifiable { }

protocol Storyboarded {
    static var storyboardName: String { get }
    static func instantiate() -> UIViewController
}

extension Storyboarded where Self: UIViewController {
    static var storyboardName: String {
        return "Main" // Puedes sobrescribir en las subclases si deseas un nombre diferente
    }

    static func instantiate() -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: String(describing: Self.self))
    }
}
