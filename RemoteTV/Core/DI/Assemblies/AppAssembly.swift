//
//  AppAssembly.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 26.05.2025.
//

import Swinject

final class AppAssembly: Assembly {
    func assemble(container: Container) {
        container.register(StorageServiceProtocol.self) { _ in
            StorageService()
        }.inObjectScope(.container)
        
        container.register(OnboardingCoordinator.self) { resolver in
            OnboardingCoordinator(container: container)
        }
        
        container.register(RemoteMainCoordinator.self) { resolver in
            RemoteMainCoordinator(container: container)
        }
    }
}
