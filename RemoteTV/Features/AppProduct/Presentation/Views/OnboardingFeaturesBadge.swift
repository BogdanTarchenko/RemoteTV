//
//  OnboardingFeaturesBadgeView.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 28.05.2025.
//

import SwiftUI

struct OnboardingFeaturesBadge: View {
    var body: some View {
        HStack(spacing: 12) {
            Image("crown")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
            Text("Access to sleep timer, touchpad\nand multimedia controller")
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.01))
                )
        )
        .padding(.horizontal, 16)
    }
}
