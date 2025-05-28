//
//  MockPurchaseUseCase.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 28.05.2025.
//

import Foundation

protocol MockPurchaseUseCaseProtocol {
    func execute() async -> Result<Void, Error>
}

final class MockPurchaseUseCase: MockPurchaseUseCaseProtocol {
    private let repository: PurchaseRepositoryProtocol
    
    init(repository: PurchaseRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async -> Result<Void, Error> {
        await repository.mockPurchase()
    }
}
