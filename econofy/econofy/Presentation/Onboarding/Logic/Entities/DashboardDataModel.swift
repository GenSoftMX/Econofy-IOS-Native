//
//  DashboardDataModel.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 04/01/25.
//

import Foundation
import CustomUI
import UIKit

class OnboardingModel {
    var title: String
    var sub: String
    var body: String
    var icon: UIImage
    var asset: UIImage

    init(asset: UIImage, title: String, sub: String, body: String, icon: UIImage) {
        self.asset = asset
        self.title = title
        self.sub = sub
        self.body = body
        self.icon = icon
    }

    static var data: [OnboardingModel] = [
        OnboardingModel(
            asset: AppImages.OnboardingAssets.onboarding_1,
            title: LocalizedKeys.Onboarding_1.title,
            sub: LocalizedKeys.Onboarding_1.subtitle,
            body: LocalizedKeys.Onboarding_1.body,
            icon: AppImages.OnboardingAssets.onboarding_ok
        ),
        OnboardingModel(
            asset: AppImages.OnboardingAssets.onboarding_2,
            title: LocalizedKeys.Onboarding_2.title,
            sub: LocalizedKeys.Onboarding_2.subtitle,
            body: LocalizedKeys.Onboarding_2.body,
            icon: AppImages.OnboardingAssets.onboarding_hand
        )
    ]
}
