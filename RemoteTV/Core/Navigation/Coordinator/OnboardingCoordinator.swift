//
//  OnboardingCoordinator.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI
import Swinject

protocol OnboardingViewModelDelegate: AnyObject {
    func viewModelDidFinishPurchase()
}

final class OnboardingCoordinator: BaseCoordinator {
    weak var delegate: OnboardingCoordinatorDelegate?
    private let container: Container
    
    @Published var currentView: AnyView?
    
    init(container: Container) {
        self.container = container
        super.init()
    }
    
    override func start() {
        let viewModel = OnboardingViewModel(container: container, delegate: self)
        let view = OnboardingView(viewModel: viewModel)
        currentView = AnyView(view)
    }
    
    private func finishPurchase() {
        delegate?.onboardingDidFinishPurchase()
    }
}

extension OnboardingCoordinator: OnboardingViewModelDelegate {
    func viewModelDidFinishPurchase() {
        finishPurchase()
    }
}
