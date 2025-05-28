//
//  OnboardingView.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI
import StoreKit

struct OnboardingView: View {
    @StateObject private var viewModel: OnboardingViewModel
    
    init(viewModel: OnboardingViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            BackgroundColor.onboarding.linearGradient
                .ignoresSafeArea()
            OnboardingPageView(currentPage: viewModel.currentPage, crossButtonAction: viewModel.handleCrossButtonTapped)
                .frame(maxWidth: .infinity)
            
            OnboardingPanelBackgroundView(
                panelHeight: viewModel.currentPanelData?.panelHeight ?? UIScreen.main.bounds.height * 0.4
            )
            
            VStack {
                if viewModel.currentPage == 3 {
                    OnboardingFeaturesBadge()
                    OnboardingPanelView(
                        title: viewModel.currentPanelData?.title ?? "",
                        description: viewModel.currentPanelData?.description ?? "",
                        buttonTitle: viewModel.currentPanelData?.buttonTitle ?? "",
                        buttonAction: viewModel.handlePurchaseButtonTapped,
                        panelHeight: viewModel.currentPanelData?.panelHeight ?? UIScreen.main.bounds.height * 0.4,
                        viewModel: viewModel
                    )
                } else {
                    OnboardingPanelView(
                        title: viewModel.currentPanelData?.title ?? "",
                        description: viewModel.currentPanelData?.description ?? "",
                        buttonTitle: viewModel.currentPanelData?.buttonTitle ?? "",
                        buttonAction: viewModel.handleMainButtonTapped,
                        panelHeight: viewModel.currentPanelData?.panelHeight ?? UIScreen.main.bounds.height * 0.4,
                        viewModel: viewModel
                    )
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .disabled(viewModel.isLoading)
        .onChange(of: viewModel.currentPage) { newValue in
            if newValue == 2 {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: windowScene)
                    print("SKStoreReviewController.requestReview(in:) called for page 2")
                }
            }
        }
    }
}
