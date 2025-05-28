//
//  OnboardingReviewCard.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 28.05.2025.
//

import SwiftUI

struct OnboardingReviewCard: View {
    var body: some View {
        ZStack(alignment: .top) {
            Image("review-splash")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            
            VStack(spacing: 30) {
                Image("person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 103, height: 103)
                
                Image("stars")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 144)
                
                Text("Thank you for the app. It connects quickly and works properly with our smart TV. The irreplaceable app, no problems with the remote anymore.")
                    .font(.body)
                    .foregroundColor(.textAndIconsWhite60)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 18)
                    .padding(.bottom, 40)
            }
            .padding(.top, 32)
        }
        .background(.bgLevel1)
        .cornerRadius(16)
        .padding(.horizontal, 24)
    }
}

#Preview {
    OnboardingReviewCard()
}
