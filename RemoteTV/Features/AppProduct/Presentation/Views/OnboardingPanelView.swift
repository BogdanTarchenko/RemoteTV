//
//  OnboardingPanelView.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI

struct OnboardingPanelView: View {
    let title: String
    let description: String
    let buttonTitle: String
    let buttonAction: () -> Void
    let panelHeight: CGFloat
    
    @ObservedObject var viewModel: OnboardingViewModel
    
    @State private var loaderRotationAngle: Double = 0
    
    init(title: String, description: String, buttonTitle: String, buttonAction: @escaping () -> Void, panelHeight: CGFloat, viewModel: OnboardingViewModel) {
        self.title = title
        self.description = description
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
        self.panelHeight = panelHeight
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 16) {
                Text(title)
                    .onboardTitleStyle()
                    .foregroundColor(.textAndIconsWhite100)
                    .multilineTextAlignment(.center)
                    .padding(.top, 32)
                
                Text(description)
                    .bodyStyle()
                    .foregroundColor(.textAndIconsWhite100)
                    .multilineTextAlignment(.center)
                
                if viewModel.currentPage == 3 {
                    OnboardingTrialSwitcher(isTrialEnabled: $viewModel.isTrialEnabled)
                }
            }
            
            Spacer()
            
            VStack(spacing: 24) {
                if viewModel.isLoading {
                    Image("loader")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                        .rotationEffect(.degrees(loaderRotationAngle))
                        .onAppear {
                            withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: false)) {
                                loaderRotationAngle = 1800
                            }
                        }
                        .onDisappear {
                            loaderRotationAngle = 0
                        }
                } else {
                    OnboardingButton(title: buttonTitle, action: buttonAction)
                }
                
                OnboardingMiscStackView()
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .frame(maxHeight: panelHeight)
    }
}
