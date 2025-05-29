//
//  RemoteMainCoordinator.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI
import Swinject

@MainActor
protocol RemoteMainViewModelDelegate: AnyObject {
    func viewModelDidRequestConnectionGuide()
}

final class RemoteMainCoordinator: BaseCoordinator {
    weak var delegate: MainCoordinatorDelegate?
    private let container: Container
    
    @Published var currentView: AnyView?
    @Published var isShowingConnectionGuide = false
    
    init(container: Container) {
        self.container = container
        super.init()
    }
    
    override func start() {
        let viewModel = RemoteMainViewModel(delegate: self)
        let view = RemoteMainView(viewModel: viewModel)
            .background(
                NavigationLink(
                    destination: ConnectionGuideView(),
                    isActive: Binding(
                        get: { self.isShowingConnectionGuide },
                        set: { self.isShowingConnectionGuide = $0 }
                    ),
                    label: { EmptyView() }
                )
            )
        currentView = AnyView(view)
    }
    
    @MainActor
    private func showConnectionGuide() {
        let view = ConnectionGuideView()
        currentView = AnyView(view)
        isShowingConnectionGuide = true
    }
    
    func returnToMainView() {
        start()
        isShowingConnectionGuide = false
    }
}

extension RemoteMainCoordinator: RemoteMainViewModelDelegate {
    @MainActor
    func viewModelDidRequestConnectionGuide() {
        showConnectionGuide()
    }
}
