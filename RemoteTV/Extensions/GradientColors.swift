//
//  GradientColors.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 26.05.2025.
//

import SwiftUI

// MARK: - View Extension
extension View {
    func primaryGradientBackground(_ color: PrimaryColor) -> some View {
        self.background(color.linearGradient)
    }
    
    func rippleGradientBackground(_ color: ButtonsRippleColor) -> some View {
        self.background(color.linearGradient)
    }
}

// MARK: - PrimaryColor
enum PrimaryColor {
    case red
    case purple
    case green
    
    var gradientColors: [Color] {
        switch self {
        case .red:
            return [
                Color(red: 200/255, green: 19/255, blue: 92/255), // #C8135C
                Color(red: 139/255, green: 4/255, blue: 58/255)   // #8B043A
            ]
        case .purple:
            return [
                Color(red: 161/255, green: 101/255, blue: 255/255), // #A165FF
                Color(red: 105/255, green: 187/255, blue: 255/255)  // #69BBFF
            ]
        case .green:
            return [
                Color(red: 107/255, green: 218/255, blue: 89/255),  // #6BDA59
                Color(red: 178/255, green: 209/255, blue: 89/255)   // #B2D159
            ]
        }
    }
    
    var stops: [Gradient.Stop] {
        switch self {
        case .red:
            return [
                .init(color: gradientColors[0], location: 0.3013),
                .init(color: gradientColors[1], location: 1.0)
            ]
        case .purple:
            return [
                .init(color: gradientColors[0], location: 0.0),
                .init(color: gradientColors[1], location: 1.0)
            ]
        case .green:
            return [
                .init(color: gradientColors[0], location: 0.0),
                .init(color: gradientColors[1], location: 1.0)
            ]
        }
    }
    
    var startPoint: UnitPoint {
        switch self {
        case .red:
            return UnitPoint(x: 0.2, y: 0.8)
        case .purple:
            return UnitPoint(x: 0.3, y: 0.7)
        case .green:
            return UnitPoint(x: 0.0, y: 1.0)
        }
    }
    
    var endPoint: UnitPoint {
        switch self {
        case .red:
            return UnitPoint(x: 0.8, y: 0.2)
        case .purple:
            return UnitPoint(x: 0.7, y: 0.3)
        case .green:
            return UnitPoint(x: 1.0, y: 0.0)
        }
    }
    
    var linearGradient: LinearGradient {
        LinearGradient(
            stops: stops,
            startPoint: startPoint,
            endPoint: endPoint
        )
    }
}

// MARK: - ButtonsRippleColor
enum ButtonsRippleColor {
    case gradientLeft
    case gradientRight
    case gradientUp
    case gradientDown
    case redGradient
    case purpleGradient
    
    var gradientColors: [Color] {
        switch self {
        case .gradientLeft:
            return [
                Color(red: 43/255, green: 42/255, blue: 69/255),  // #2B2A45
                Color(red: 69/255, green: 67/255, blue: 98/255)   // #454362
            ]
        case .gradientRight:
            return [
                Color(red: 69/255, green: 67/255, blue: 98/255),  // #454362
                Color(red: 43/255, green: 42/255, blue: 69/255)   // #2B2A45
            ]
        case .gradientUp:
            return [
                Color(red: 43/255, green: 42/255, blue: 69/255),  // #2B2A45
                Color(red: 69/255, green: 67/255, blue: 98/255)   // #454362
            ]
        case .gradientDown:
            return [
                Color(red: 69/255, green: 67/255, blue: 98/255),  // #454362
                Color(red: 43/255, green: 42/255, blue: 69/255)   // #2B2A45
            ]
        case .redGradient:
            return [
                Color(red: 159/255, green: 5/255, blue: 67/255),  // #9F0543
                Color(red: 115/255, green: 2/255, blue: 48/255)   // #730230
            ]
        case .purpleGradient:
            return [
                Color(red: 118/255, green: 31/255, blue: 255/255), // #761FFF
                Color(red: 36/255, green: 156/255, blue: 255/255)  // #249CFF
            ]
        }
    }
    
    var stops: [Gradient.Stop] {
        switch self {
        case .gradientLeft, .gradientRight, .gradientUp, .gradientDown:
            return [
                .init(color: gradientColors[0], location: 0.0),
                .init(color: gradientColors[1], location: 1.0)
            ]
        case .redGradient:
            return [
                .init(color: gradientColors[0], location: 0.3013),
                .init(color: gradientColors[1], location: 1.0)
            ]
        case .purpleGradient:
            return [
                .init(color: gradientColors[0], location: 0.0),
                .init(color: gradientColors[1], location: 1.0)
            ]
        }
    }
    
    var startPoint: UnitPoint {
        switch self {
        case .gradientLeft, .gradientRight:
            return UnitPoint.leading
        case .gradientUp, .gradientDown:
            return UnitPoint.top
        case .redGradient:
            return UnitPoint(x: 0.2, y: 0.8)
        case .purpleGradient:
            return UnitPoint(x: 0.3, y: 0.7)
        }
    }
    
    var endPoint: UnitPoint {
        switch self {
        case .gradientLeft, .gradientRight:
            return UnitPoint.trailing
        case .gradientUp, .gradientDown:
            return UnitPoint.bottom
        case .redGradient:
            return UnitPoint(x: 0.8, y: 0.2)
        case .purpleGradient:
            return UnitPoint(x: 0.7, y: 0.3)
        }
    }
    
    var linearGradient: LinearGradient {
        LinearGradient(
            stops: stops,
            startPoint: startPoint,
            endPoint: endPoint
        )
    }
}
