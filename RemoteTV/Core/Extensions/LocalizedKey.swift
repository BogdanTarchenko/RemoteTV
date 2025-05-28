//
//  LocalizedKey.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import Foundation

enum LocalizedKey {
    static func localized(_ key: String) -> String {
        NSLocalizedString(key, comment: "")
    }
    
    enum OnboardingMiscStackView {
        static let leadingText: String = localized("privacy_policy")
        static let centerText: String = localized("restore")
        static let trailingText: String = localized("terms_of_use")
    }
}
