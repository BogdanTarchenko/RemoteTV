//
//  PrimaryGradientToggleStyle.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 28.05.2025.
//

import SwiftUI

struct PrimaryGradientToggleStyle: ToggleStyle {
    let color: PrimaryColor

    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Capsule()
                .fill(configuration.isOn ? AnyShapeStyle(color.linearGradient) : AnyShapeStyle(Color.bgLevel1))
                .frame(width: 51, height: 31)
                .overlay(alignment: configuration.isOn ? .trailing : .leading) {
                    Circle()
                        .fill(Color.white)
                        .shadow(radius: 1, x: 0, y: 1)
                        .padding(1.5)
                }
        }
        .animation(.easeInOut(duration: 0.2), value: configuration.isOn)
        .buttonStyle(.plain)
    }
}

extension ToggleStyle where Self == PrimaryGradientToggleStyle {
    static func primaryGradient(_ color: PrimaryColor) -> PrimaryGradientToggleStyle {
        PrimaryGradientToggleStyle(color: color)
    }
}
