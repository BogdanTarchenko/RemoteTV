//
//  AppCoordinator.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 26.05.2025.
//

import SwiftUI
import Swinject

final class AppCoordinator: BaseCoordinator, ObservableObject {
    private let container: Container
    
    @Published var currentFlow: AppFlow = .onboarding
    
    enum AppFlow {
        case onboarding
        case main
    }
    
    init(container: Container) {
        self.container = container
        super.init()
    }
    
    override func start() {
        Task {
            let status = await container.resolve(PurchaseRepositoryProtocol.self)!.checkPurchaseStatus()
            await MainActor.run {
                switch status {
                case .purchased:
                    showMain()
                case .notPurchased, .pending:
                    showOnboarding()
                }
            }
        }
    }
    
    private func showOnboarding() {
        let coordinator = OnboardingCoordinator(container: container)
        addDependency(coordinator)
        coordinator.delegate = self
        coordinator.start()
        currentFlow = .onboarding
    }
    
    private func showMain() {
        let coordinator = RemoteMainCoordinator(container: container)
        addDependency(coordinator)
        coordinator.delegate = self
        coordinator.start()
        currentFlow = .main
    }
}

// MARK: - Delegates Extensions
extension AppCoordinator: OnboardingCoordinatorDelegate {
    func onboardingDidFinish() {
        removeDependency(childCoordinators.last)
        showMain()
    }
}

extension AppCoordinator: MainCoordinatorDelegate {
    func mainDidFinish() {
        removeDependency(childCoordinators.last)
        showOnboarding()
    }
}
