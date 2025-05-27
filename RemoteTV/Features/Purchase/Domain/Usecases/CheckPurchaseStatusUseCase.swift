//
//  CheckPurchaseStatusUseCase.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import Foundation

protocol CheckPurchaseStatusUseCaseProtocol {
    func execute() async -> PurchaseStatus
}

final class CheckPurchaseStatusUseCase: CheckPurchaseStatusUseCaseProtocol {
    private let repository: PurchaseRepositoryProtocol
    
    init(repository: PurchaseRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async -> PurchaseStatus {
        await repository.checkPurchaseStatus()
    }
}
