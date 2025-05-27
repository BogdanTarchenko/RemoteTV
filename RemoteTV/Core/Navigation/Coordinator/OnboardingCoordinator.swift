//
//  OnboardingCoordinator.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI
import Swinject

final class OnboardingCoordinator: BaseCoordinator {
    weak var delegate: OnboardingCoordinatorDelegate?
    private let container: Container
    
    @Published var currentView: AnyView?
    
    init(container: Container) {
        self.container = container
        super.init()
    }
    
    override func start() {
        let viewModel = OnboardingViewModel(container: container)
        let view = OnboardingView(viewModel: viewModel)
            .background(Color.red)
        currentView = AnyView(view)
    }
}
