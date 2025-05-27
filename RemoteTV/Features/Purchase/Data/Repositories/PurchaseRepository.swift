//
//  PurchaseRepository.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

final class PurchaseRepository: PurchaseRepositoryProtocol {
    private let storage: StorageServiceProtocol
    
    init(storage: StorageServiceProtocol) {
        self.storage = storage
    }
    
    func checkPurchaseStatus() async -> PurchaseStatus {
        if let status: PurchaseStatus = try? await storage.load(forKey: "purchase_status") {
            return status
        }
        return .notPurchased
    }
    
    func savePurchaseStatus(_ status: PurchaseStatus) async {
        try? await storage.save(status, forKey: "purchase_status")
    }
    
    func mockPurchase() async -> Bool {
        try? await Task.sleep(nanoseconds: 1000000000)
        await savePurchaseStatus(.purchased)
        return true
    }
}
