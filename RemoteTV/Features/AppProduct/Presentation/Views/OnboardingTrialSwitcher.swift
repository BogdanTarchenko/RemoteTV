//
//  OnboardingTrialSwitcher.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 28.05.2025.
//

import SwiftUI

struct OnboardingTrialSwitcher: View {
    @Binding var isTrialEnabled: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                if isTrialEnabled {
                    Text("3-day free trial enabled")
                        .bodyStyle()
                        .foregroundColor(.textAndIconsWhite100)
                } else {
                    Text("Not sure yet?")
                        .bodyStyle()
                        .foregroundColor(.textAndIconsWhite100)
                    
                    Text("Enable a 3-day free trial")
                        .captionStyle()
                        .foregroundColor(.textAndIconsWhite60)
                }
            }
            
            Spacer()
            
            Toggle("", isOn: $isTrialEnabled)
                .labelsHidden()
                .toggleStyle(.primaryGradient(.red))
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .frame(maxHeight: 64)
        .background(.bgLevel2)
        .cornerRadius(12)
        .padding(.horizontal, 16)
    }
}

#Preview {
    OnboardingTrialSwitcher(isTrialEnabled: .constant(false))
}
