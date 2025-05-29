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
    @State private var showSettings = false
    
    init(viewModel: RemoteMainViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.bgLevel1.edgesIgnoringSafeArea(.all)
            
            RemoteMainPageView(currentPage: viewModel.currentPage, connectionGuideButtonAction: {
                showConnectionGuide = true
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            trailing:
                Button(action: {
                    showSettings = true
                }) {
                    Image("settings")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
        )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Connect device")
                    .bodyStyle()
                    .foregroundColor(.textAndIconsWhite100)
            }
        }
        .background(
            NavigationLink(
                destination: ConnectionGuideView(),
                isActive: $showConnectionGuide,
                label: { EmptyView() }
            )
            .background(EmptyView())
        )
        .background(
            NavigationLink(
                destination: SettingsView(),
                isActive: $showSettings,
                label: { EmptyView() }
            )
            .background(EmptyView())
        )
    }
}
