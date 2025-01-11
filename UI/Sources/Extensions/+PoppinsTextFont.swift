//
//  +UIFont.swift
//  CustomUI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 09/01/25.
//

import UIKit

/// UIFont extension for easy access to Poppins font styles.
public extension UIFont {

    struct Poppins {

        public static let black14 = fixed(.black, size: 14)
        public static let black16 = fixed(.black, size: 16)

        public static let semiBold12 = fixed(.semiBold, size: 12)
        public static let semiBold16 = fixed(.semiBold, size: 16)
        public static let semiBold24 = fixed(.semiBold, size: 24)

        public static let medim16 = fixed(.medim, size: 16)

        public static let regular10 = fixed(.regular, size: 10)
        public static let regular12 = fixed(.regular, size: 12)
        public static let regular14 = fixed(.regular, size: 14)
        public static let regular16 = fixed(.regular, size: 16)
        public static let regular28 = fixed(.regular, size: 28)

        public static func customFont(size: CGFloat, style: PoppinsTextFont) -> UIFont {
           return fixed(style, size: size)
        }
        
        private static func fixed(_ style: PoppinsTextFont, size: CGFloat) -> UIFont {
            guard let font = UIFont(name: style.name, size: size) else {
                fatalError("Font \(style.name) is not available.")
            }
            return font
        }
    }
}
