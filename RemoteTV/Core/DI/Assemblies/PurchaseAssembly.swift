//
//  PurchaseAssembly.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import Swinject

final class PurchaseAssembly: Assembly {
    func assemble(container: Container) {
        if container.resolve(StorageServiceProtocol.self) == nil {
            container.register(StorageServiceProtocol.self) { _ in
                StorageService()
            }.inObjectScope(.container)
        }
        
        container.register(PurchaseRepositoryProtocol.self) { resolver in
            PurchaseRepository(storage: resolver.resolve(StorageServiceProtocol.self)!)
        }
        
        container.register(CheckPurchaseStatusUseCaseProtocol.self) { resolver in
            CheckPurchaseStatusUseCase(
                repository: resolver.resolve(PurchaseRepositoryProtocol.self)!
            )
        }
        
        container.register(MockPurchaseUseCaseProtocol.self) { resolver in
            MockPurchaseUseCase(
                repository: resolver.resolve(PurchaseRepositoryProtocol.self)!
            )
        }
    }
}
