//
//  SettingsButton.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 30.05.2025.
//

import SwiftUI

struct SettingsButton: View {
    let iconName: String
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.textAndIconsWhite100)

                Text(title)
                    .bodyStyle()
                    .foregroundColor(.textAndIconsWhite100)

                Spacer()

                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
                    .foregroundColor(.textAndIconsWhite100)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            .background(Color.bgLevel2)
            .cornerRadius(12)
        }
    }
}
