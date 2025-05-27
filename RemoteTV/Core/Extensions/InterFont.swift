//
//  InterFont.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 26.05.2025.
//

import SwiftUI

extension Font {
    static let onboardTitle = Font.custom("Inter18pt-Bold", size: 28)
    static let body = Font.custom("Inter18pt-Regular", size: 16)
    static let body1 = Font.custom("Inter18pt-Regular", size: 14)
    static let caption = Font.custom("Inter18pt-Regular", size: 12)
    static let buttonText = Font.custom("Inter18pt-Bold", size: 18)
    static let remoteButton = Font.custom("Inter18pt-Regular", size: 12)
    static let timer = Font.custom("Inter18pt-Regular", size: 68)
}

// MARK: - View Modifiers
extension View {
    func onboardTitleStyle() -> some View {
        self.font(.onboardTitle)
    }
    
    func bodyStyle() -> some View {
        self.font(.body)
    }
    
    func body1Style() -> some View {
        self.font(.body1)
    }
    
    func captionStyle() -> some View {
        self.font(.caption)
    }
    
    func buttonTextStyle() -> some View {
        self.font(.buttonText)
    }
    
    func remoteButtonStyle() -> some View {
        self.font(.remoteButton)
    }
    
    func timerStyle() -> some View {
        self.font(.timer)
    }
}
