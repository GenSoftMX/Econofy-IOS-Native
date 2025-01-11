//
//  AppImages.swift
//  UI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 03/01/25.
//

import UIKit

public struct AppImages {
    
    public static let econofy = UIImage.loadImage(named: "Econofy")
        
    private struct Onboarding {
        static let onboarding_1 = "Onboarding-1"
        static let onboarding_2 = "Onboarding-2"
        static let onboarding_ok = "hand"
        static let onboarding_hand = "ok"
    }
    
   public struct OnboardingAssets {
       public static let onboarding_1 = UIImage.loadImage(named: Onboarding.onboarding_1)
       public static let onboarding_2 = UIImage.loadImage(named: Onboarding.onboarding_2)
       public static let onboarding_ok = UIImage.loadImage(named: Onboarding.onboarding_ok)
       public static let onboarding_hand = UIImage.loadImage(named: Onboarding.onboarding_hand)
    }
    
    public struct Authentication {
        public static let authenticate = UIImage.loadImage(named: "LogoSignUp")
        public static let login = UIImage.loadImage(named: "LogoLogin")
    }
    
    public struct SocialProviders {
        public static let facebook = UIImage.loadImage(named: "Facebook")
        public static let google = UIImage.loadImage(named: "Google")
    }
}

