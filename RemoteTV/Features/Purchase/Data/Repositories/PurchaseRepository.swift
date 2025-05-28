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
        if let status: PurchaseStatus = try? await storage.load(forKey: "purchase_status1") {
            return status
        }
        return .notPurchased
    }
    
    func savePurchaseStatus(_ status: PurchaseStatus) async {
        try? await storage.save(status, forKey: "purchase_status")
    }
    
    func mockPurchase() async -> Result<Void, Error> {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            await savePurchaseStatus(.purchased)
            
            return .success(())
        } catch {
            return .failure(error)
        }
    }
}
