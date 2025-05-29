//
//  RemoteMainConnectionGuideButton.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 29.05.2025.
//

import SwiftUI

struct RemoteMainConnectionGuideButton: View {
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Connection Guide")
                        .bodyStyle()
                        .foregroundColor(.textAndIconsWhite100)
                    
                    Text("Learn how to connect to your TV\nin just a few easy steps")
                        .captionStyle()
                        .foregroundColor(.textAndIconsWhite60)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 14)
                    .foregroundColor(.textAndIconsWhite100)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.bgLevel2, lineWidth: 2)
            )
        }
        .buttonStyle(.plain)
        .padding(.horizontal, 16)
    }
}
