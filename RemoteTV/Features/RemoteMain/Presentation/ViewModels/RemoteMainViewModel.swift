//
//  RemoteMainViewModel.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import Foundation
import Swinject

final class RemoteMainViewModel: ObservableObject {
    @Published var currentPage = 0 {
        didSet {
            
        }
    }
    
    @Published private(set) var isLoading = false
    @Published private(set) var error: Error?
    
    weak var delegate: RemoteMainViewModelDelegate?
    
    init(delegate: RemoteMainViewModelDelegate? = nil) {
        self.delegate = delegate
    }
    
    @MainActor
    func handleConnectionGuideButtonTapped() {
        delegate?.viewModelDidRequestConnectionGuide()
    }
}
