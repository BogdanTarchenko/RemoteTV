//
//  PurchaseRepositoryProtocol.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import Foundation

protocol PurchaseRepositoryProtocol {
    func checkPurchaseStatus() async -> PurchaseStatus
    func savePurchaseStatus(_ status: PurchaseStatus) async
    func mockPurchase() async -> Result<Void, Error>
}
