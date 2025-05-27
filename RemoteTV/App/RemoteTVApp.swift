//
//  RemoteTVApp.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 26.05.2025.
//

import SwiftUI
import Swinject

@main
struct RemoteTVApp: App {
    private static let container: Container = {
        let container = Container()
        
        let assemblies: [Assembly] = [
            AppAssembly(),
            PurchaseAssembly()
        ]
        
        assemblies.forEach { $0.assemble(container: container) }
        
        container.register(AppCoordinator.self) { _ in
            AppCoordinator(container: container)
        }.inObjectScope(.container)
        
        return container
    }()
    
    private let container = RemoteTVApp.container
    
    @StateObject private var appCoordinator: AppCoordinator
    
    init() {
        let coordinator = container.resolve(AppCoordinator.self)!
        _appCoordinator = StateObject(wrappedValue: coordinator)
        coordinator.start()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Group {
                    switch appCoordinator.currentFlow {
                    case .onboarding:
                        if let onboardingCoordinator = appCoordinator.childCoordinators.last as? OnboardingCoordinator {
                            onboardingCoordinator.currentView
                        }
                    case .main:
                        if let mainCoordinator = appCoordinator.childCoordinators.last as? RemoteMainCoordinator {
                            mainCoordinator.currentView
                        }
                    }
                }
            }
        }
    }
}
