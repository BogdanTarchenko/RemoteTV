//
//  RemoteMainView.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI

struct RemoteMainView: View {
    @StateObject private var viewModel: RemoteMainViewModel
    @State private var showConnectionGuide = false
    
    init(viewModel: RemoteMainViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Color.bgLevel1.edgesIgnoringSafeArea(.all)
                
                RemoteMainPageView(currentPage: viewModel.currentPage, connectionGuideButtonAction: {
                    showConnectionGuide = true
                })
            }
            .navigationBarHidden(true)
            .background(
                NavigationLink(
                    destination: ConnectionGuideView(),
                    isActive: $showConnectionGuide,
                    label: { EmptyView() }
                )
            )
        }
    }
}
