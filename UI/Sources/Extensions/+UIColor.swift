
//
//  +UIColor.swift
//  CustomUI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 07/01/25.
//
import UIKit

extension UIColor {
    /// Initializes a UIColor object with a hexadecimal string representation.
     ///
     /// - Parameter hex: A hexadecimal string representation of the color.
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.hasPrefix("#") ? String(hexSanitized.dropFirst()) : hexSanitized

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let green = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let blue = CGFloat(rgb & 0xFF) / 255.0
        let alpha = hexSanitized.count == 8 ? CGFloat((rgb >> 24) & 0xFF) / 255.0 : 1.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// Loads a color from the asset catalog by name.
      ///
      /// - Parameter named: The name of the color asset.
      /// - Returns: The UIColor object representing the color asset.
      static func loadColor(named: String) -> UIColor {
          // Load color from the asset catalog
          guard let color = UIColor(named: named, in: Bundle.module, compatibleWith: nil) else {
              // If unable to load, abort the program
              abort()
          }
          
          return color
      }
}
