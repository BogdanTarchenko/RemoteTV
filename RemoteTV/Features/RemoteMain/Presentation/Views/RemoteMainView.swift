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
    @State private var showDeviceConnection = false
    
    init(viewModel: RemoteMainViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.bgLevel1.edgesIgnoringSafeArea(.all)
            
            RemoteMainPageView(currentPage: viewModel.currentPage, connectionGuideButtonAction: {
                showConnectionGuide = true
            })
            .padding(.bottom, 16)
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
                Button(action: {
                    showDeviceConnection = true
                }) {
                    HStack(alignment: .center, spacing: 8) {
                        Text(viewModel.connectedDeviceName == "" ? "Connect device" : viewModel.connectedDeviceName)
                            .bodyStyle()
                            .foregroundColor(.textAndIconsWhite100)
                        Image(systemName: "chevron.down")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 8)
                            .foregroundColor(.textAndIconsWhite100)
                    }
                }
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
        
        .background(
            NavigationLink(
                destination: DeviceConnectionView(viewModel: DeviceConnectionViewModel()),
                isActive: $showDeviceConnection,
                label: { EmptyView() }
            )
            .background(EmptyView())
        )

    }
}
