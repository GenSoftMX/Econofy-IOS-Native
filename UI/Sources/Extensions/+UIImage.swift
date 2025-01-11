//
//  File.swift
//  UI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 03/01/25.
//

import Foundation

import UIKit

public extension UIImage {

     static func loadImage(named: String) -> UIImage {
        guard let image = UIImage(named: named, in: Bundle.module, compatibleWith: nil) else { abort() }

        return image
    }
}
