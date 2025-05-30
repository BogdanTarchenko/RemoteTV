//
//  RemoteMainViewModel.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import Foundation
import Swinject

final class RemoteMainViewModel: ObservableObject {
    // Тут через TabView сделал бы потом, currentPage определял бы состояние пульта
    @Published var currentPage = 0 {
        didSet {
            
        }
    }
    
    @Published private(set) var isLoading = false
    @Published private(set) var error: Error?
    
    @Published var connectedDeviceName: String = ""
    
    weak var delegate: RemoteMainViewModelDelegate?
    
    init(delegate: RemoteMainViewModelDelegate? = nil) {
        self.delegate = delegate
    }
    
    @MainActor
    func handleConnectionGuideButtonTapped() {
        delegate?.viewModelDidRequestConnectionGuide()
    }
}
