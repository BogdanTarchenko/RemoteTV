//
//  RemoteMainCoordinator.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI
import Swinject

final class RemoteMainCoordinator: BaseCoordinator {
    weak var delegate: MainCoordinatorDelegate?
    private let container: Container
    
    @Published var currentView: AnyView?
    
    init(container: Container) {
        self.container = container
        super.init()
    }
    
    override func start() {
        let viewModel = RemoteMainViewModel(container: container)
        let view = RemoteMainView(viewModel: viewModel)
        currentView = AnyView(view)
    }
}
