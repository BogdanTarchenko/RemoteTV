//
//  OnboardingViewModel.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import Foundation
import Swinject
import UIKit

final class OnboardingViewModel: ObservableObject {
    @Published var currentPage = 0 {
        didSet {
            updateCurrentPanelData()
        }
    }
    @Published private(set) var isLoading = false
    @Published private(set) var error: Error?
    
    @Published var currentPanelData: OnboardingPanelData?
    
    @Published var isTrialEnabled = false {
        didSet {
            if currentPage == onboardingPagesData.count - 1 {
                updateCurrentPanelData()
            }
        }
    }
    
    private let mockPurchaseUsecase: MockPurchaseUseCaseProtocol
    
    weak var delegate: OnboardingViewModelDelegate?
    
    private let onboardingPagesData: [OnboardingPanelData]
    
    init(container: Container, delegate: OnboardingViewModelDelegate? = nil) {
        self.mockPurchaseUsecase = container.resolve(MockPurchaseUseCaseProtocol.self)!
        self.delegate = delegate
        
        self.onboardingPagesData = [
            OnboardingPanelData(
                title: "Smart TV control",
                description: "Easiest way to control your smart TV with your phone",
                buttonTitle: "Continue",
                panelHeight: UIScreen.main.bounds.height * 0.4
            ),
            OnboardingPanelData(
                title: "Your feedback matters",
                description: "Your feedback is highly appreciated to make your experience smoother",
                buttonTitle: "Continue",
                panelHeight: UIScreen.main.bounds.height * 0.4
            ),
            OnboardingPanelData(
                title: "Remote always at hand",
                description: "No more wasting time looking for the remote control over and over again",
                buttonTitle: "Continue",
                panelHeight: UIScreen.main.bounds.height * 0.4
            ),
            OnboardingPanelData(
                title: "A must for Smart TV",
                description: "Subscribe to unlock all the features,\njust $4.99/week",
                buttonTitle: "Continue",
                panelHeight: UIScreen.main.bounds.height * 0.5
            )
        ]
        
        updateCurrentPanelData()
    }
    
    private func goToNextPage() {
        guard currentPage < onboardingPagesData.count - 1 else {
            return
        }
        currentPage += 1
    }
    
    func handleMainButtonTapped() {
        goToNextPage()
    }
    
    func handlePurchaseButtonTapped() {
        Task {
            await purchase()
        }
    }
    
    func handleCrossButtonTapped() {
        goToMain()
    }
    
    private func goToMain() {
        delegate?.viewModelDidFinishPurchase()
    }
    
    @MainActor
    private func purchase() async {
        isLoading = true
        defer { isLoading = false }
        let result = await mockPurchaseUsecase.execute()
        
        switch result {
        case .success:
            delegate?.viewModelDidFinishPurchase()
        case .failure(_):
            print("Ошибка оплаты")
        }
    }
    
    func descriptionForLastPage() -> String {
        let baseDescription = "Subscribe to unlock all the features,\njust $4.99/week"
        if isTrialEnabled {
            return baseDescription + " + 3-day free trial"
        } else {
            return baseDescription
        }
    }
    
    func buttonTitleForLastPage() -> String {
        if isTrialEnabled {
            return "Try free"
        } else {
            return "Continue"
        }
    }
    
    private func updateCurrentPanelData() {
        if currentPage < onboardingPagesData.count {
            var data = onboardingPagesData[currentPage]
            if currentPage == onboardingPagesData.count - 1 {
                data.description = descriptionForLastPage()
                data.buttonTitle = buttonTitleForLastPage()
            }
            currentPanelData = data
        } else {
            currentPanelData = nil
        }
    }
}
