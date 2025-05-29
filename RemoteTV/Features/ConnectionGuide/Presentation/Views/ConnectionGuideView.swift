//
//  ConnectionGuideView.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI

struct ConnectionGuideView: View {
    @Environment(\.presentationMode) var presentationMode
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.bgLevel1)
        
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.textAndIconsWhite100)]
        appearance.titleTextAttributes = [.foregroundColor: UIColor(Color.textAndIconsWhite100)]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack {
            Color.bgLevel1.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Please note!")
                            .buttonTextStyle()
                            .foregroundColor(.textAndIconsWhite100)
                        Text("The remote only works with IG TVs")
                            .bodyStyle()
                            .foregroundColor(.textAndIconsWhite100)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(PrimaryColor.red.linearGradient, lineWidth: 2)
                    )
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Step 1: Connecting to a local network")
                            .buttonTextStyle()
                            .foregroundColor(.textAndIconsWhite100)
                        
                        HStack(alignment: .center, spacing: 8) {
                            Image("warning")
                            Text("Be sure to connect your phone and TV to the same Wi-Fi network")
                                .bodyStyle()
                                .foregroundColor(.textAndIconsWhite100)
                        }
                        
                        Text("If you denied local network access at login, go to your phone's settings to grant permission")
                            .bodyStyle()
                            .foregroundColor(.textAndIconsWhite60)
                        
                        Image("connection-guide-step1-image")
                            .resizable()
                            .scaledToFit()
                        
                        Text("Step 2: Connect your device")
                            .buttonTextStyle()
                            .foregroundColor(.textAndIconsWhite100)
                        
                        Text("Open the device search and connection screen by clicking the \"Connect device\" button at the top of the screen")
                            .bodyStyle()
                            .foregroundColor(.textAndIconsWhite60)
                        
                        Image("connection-guide-step2-image1")
                            .resizable()
                            .scaledToFit()
                        
                        Text("Wait until the search for devices is complete and connect the necessary one")
                            .bodyStyle()
                            .foregroundColor(.textAndIconsWhite60)
                        
                        Image("connection-guide-step2-image2")
                            .resizable()
                            .scaledToFit()
                        
                        Text("Step 3: Using the Remote")
                            .buttonTextStyle()
                            .foregroundColor(.white)
                        
                        Text("Switch between sections of the remote control using the button on the right side of the screen")
                            .bodyStyle()
                            .foregroundColor(.textAndIconsWhite60)
                        
                        Image("connection-guide-step3-image1")
                            .resizable()
                            .scaledToFit()
                        
                        Text("Swipe to open extended functionality")
                            .bodyStyle()
                            .foregroundColor(.textAndIconsWhite60)
                        
                        Image("connection-guide-step3-image2")
                            .resizable()
                            .scaledToFit()
                        
                        Text("Use the touchpad function to open the desired section on your TV by sliding your finger across the touch zone")
                            .bodyStyle()
                            .foregroundColor(.textAndIconsWhite60)
                        
                        Image("connection-guide-step3-image3")
                            .resizable()
                            .scaledToFit()
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
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
                Text("Connection Guide")
                    .bodyStyle()
                    .foregroundColor(.textAndIconsWhite100)
            }
        }
    }
}

#Preview {
    ConnectionGuideView()
}
