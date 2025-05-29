//
//  SettingsView.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI
import UIKit

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isShareSheetShowing = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.bgLevel1.ignoresSafeArea(edges: .all)
            
            VStack(spacing: 12) {
                SettingsButton(iconName: "privacy-policy", title: "Privacy Policy", action: {
                    if let url = URL(string: Constants.privacyPolicyURLString) {
                        UIApplication.shared.open(url)
                    }
                })
                
                SettingsButton(iconName: "terms-of-use", title: "Terms of Use", action: {
                    if let url = URL(string: Constants.termsOfUseURLString) {
                        UIApplication.shared.open(url)
                    }
                })
                
                SettingsButton(iconName: "share-app", title: "Share app", action: {

                    isShareSheetShowing = true
                })
                
                SettingsButton(iconName: "support", title: "Support", action: {
                    
                })
            }
            .padding(16)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
        )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Settings")
                    .bodyStyle()
                    .foregroundColor(.textAndIconsWhite100)
            }
        }

        .sheet(isPresented: $isShareSheetShowing) {
            ShareSheetView(activityItems: ["Try RemoteTV!"])
        }
    }
}

extension SettingsView {
    enum Constants {
        static let privacyPolicyURLString = "https://docs.google.com/document/d/1wY6VO-Xg6DStAav4ywjC236OuebpvqHqjIliZdMz9LE/edit?usp=sharing"
        static let termsOfUseURLString = "https://docs.google.com/document/d/1HOGEoKmiRYtQK_7kFne9oKCUmijPSSbhrYnzS1hzsAo/edit?usp=sharing"
    }
}

struct ShareSheetView: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheetView>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareSheetView>) {

    }
}

#Preview {
    SettingsView()
}
