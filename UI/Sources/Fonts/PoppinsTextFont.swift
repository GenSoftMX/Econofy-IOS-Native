//
//  AppFonts.swift
//  CustomUI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 09/01/25.
//
import UIKit
import CoreGraphics
import CoreText


/// Structure to handle SF Pro Text font.
public struct PoppinsTextFont: Sendable {

    public static let medim = PoppinsTextFont(named: "Poppins-Medium")
    public static let regular = PoppinsTextFont(named: "Poppins-Regular")
    public static let black = PoppinsTextFont(named: "Poppins-Black")
    public static let semiBold = PoppinsTextFont(named: "Poppins-SemiBold")


    /// Name of the font.
    public let name: String

    /// Initialize the font with the specified name.
    ///
    /// - Parameter named: The name of the font.
    private init(named name: String) {
        self.name = name

        FontRegistrar.shared.registerFontIfNeeded(named: name)

    }
}
