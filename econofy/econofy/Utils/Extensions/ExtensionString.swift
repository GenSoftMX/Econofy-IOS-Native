//
//  String.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 03/01/25.
//

import Foundation
import UIKit

extension String {
    // this function is used to obtain the Localizable.strings
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
}
