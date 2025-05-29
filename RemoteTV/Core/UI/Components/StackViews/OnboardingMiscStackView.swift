//
//  OnboardingMiscStackView.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI
import UIKit

struct OnboardingMiscStackView: View {
    let leadingText: String = Constants.leadingText
    let centerText: String = Constants.centerText
    let trailingText: String = Constants.trailingText
    
    var body: some View {
        HStack {
            Button(action: {
                if let url = URL(string: Constants.privacyPolicyURLString) {
                    UIApplication.shared.open(url)
                }
            }) {
                Text(leadingText)
                    .font(.caption)
                    .foregroundColor(.textAndIconsWhite60)
            }
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text(centerText)
                    .font(.caption)
                    .foregroundColor(.textAndIconsWhite60)
            }
            
            Spacer()
            
            Button(action: {
                if let url = URL(string: Constants.termsOfUseURLString) {
                    UIApplication.shared.open(url)
                }
            }) {
                Text(trailingText)
                    .font(.caption)
                    .foregroundColor(.textAndIconsWhite60)
            }
        }
        .padding(.horizontal, Constants.containerHorizontalPadding)
        .padding(.vertical, Constants.containerVerticalPadding)
    }
}

private extension OnboardingMiscStackView {
    enum Constants {
        static let containerHorizontalPadding: CGFloat = 8
        static let containerVerticalPadding: CGFloat = 11.5
        
        static let leadingText: String = LocalizedKey.OnboardingMiscStackView.leadingText
        static let centerText: String = LocalizedKey.OnboardingMiscStackView.centerText
        static let trailingText: String = LocalizedKey.OnboardingMiscStackView.trailingText
        
        static let privacyPolicyURLString = "https://docs.google.com/document/d/1wY6VO-Xg6DStAav4ywjC236OuebpvqHqjIliZdMz9LE/edit?usp=sharing"
        static let termsOfUseURLString = "https://docs.google.com/document/d/1HOGEoKmiRYtQK_7kFne9oKCUmijPSSbhrYnzS1hzsAo/edit?usp=sharing"
    }
}
