//
//  OnboardingButton.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI

struct OnboardingButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.buttonText)
                .foregroundColor(.textAndIconsWhite100)
                .frame(maxWidth: .infinity)
                .frame(height: Constants.buttonHeight)
                .background(PrimaryColor.red.linearGradient)
                .cornerRadius(Constants.buttonCornerRadius)
        }
    }
}

private extension OnboardingButton {
    enum Constants {
        static let buttonHeight: CGFloat = 64
        static let buttonCornerRadius: CGFloat = 12
    }
}
