//
//  DeviceConnectionView.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI

struct DeviceConnectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: DeviceConnectionViewModel
    
    var body: some View {
        ZStack {
            Color.bgLevel1.edgesIgnoringSafeArea(.all)
            
            VStack {
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("close")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
        )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Device Detection")
                    .bodyStyle()
                    .foregroundColor(.textAndIconsWhite100)
            }
        }
        
        .onAppear {
            viewModel.startDeviceDiscovery()
        }
        .onDisappear {
            viewModel.stopDeviceDiscovery()
        }
    }
}
