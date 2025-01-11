//
//  AppConstans.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 04/01/25.
//

import Foundation
import UIKit

struct AppConstans {

   static var keyWindow: UIWindow? {
       if #available(iOS 13, *) {
           if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
               return windowScene.windows.first { $0.isKeyWindow }
           }
           return nil
       } else {
           return UIApplication.shared.keyWindow
       }
   }
}
