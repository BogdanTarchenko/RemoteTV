//
//  OnboardingPageView.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI

struct OnboardingPageView: View {
    let currentPage: Int
    let crossButtonAction: () -> Void
    
    var body: some View {
        switch currentPage {
        case 0:
            Image("onboarding-devices")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea(edges: .top)
        case 1:
            VStack {
                OnboardingReviewCard()
                    .padding(.top, UIScreen.main.bounds.height * 0.05)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        case 2:
            Image("remote-mock")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea(edges: .top)
        case 3:
            ZStack(alignment: .topTrailing) {
                Image("paywall-image")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .ignoresSafeArea(edges: .top)
                
                Button {
                    crossButtonAction()
                } label: {
                    Image("cross")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 56, maxHeight: 56)
                }
            }
        default:
            EmptyView()
        }
    }
}
