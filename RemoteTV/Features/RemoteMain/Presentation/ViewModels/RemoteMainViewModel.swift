//
//  RemoteMainViewModel.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import Foundation
import Swinject

final class RemoteMainViewModel: ObservableObject {
    @Published private(set) var isLoading = false
    @Published private(set) var error: Error?
    
    private let purchaseRepository: PurchaseRepositoryProtocol
    
    init(container: Container) {
        self.purchaseRepository = container.resolve(PurchaseRepositoryProtocol.self)!
    }
}
