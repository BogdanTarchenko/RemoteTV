//
//  OnboardingPanelBackgroundView.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 28.05.2025.
//

import SwiftUI

struct OnboardingPanelBackgroundView: View {
    let panelHeight: CGFloat
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.bgLevel1
                .frame(maxHeight: panelHeight)
                .cornerRadius(24, corners: [.topLeft, .topRight])
            
            Color.bgLevel1
                .frame(height: UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .first?.windows
                    .first?.safeAreaInsets.bottom ?? 0)
                .background(.bgLevel1)
                .ignoresSafeArea(edges: .bottom)
        }
    }
}
