//
//  RemoteMainPageView.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI

struct RemoteMainPageView: View {
    let currentPage: Int
    let connectionGuideButtonAction: () -> Void
    
    var body: some View {
        switch currentPage {
        case 0:
            RemoteMainConnectionGuideButton(action: connectionGuideButtonAction)
        case 1:
            EmptyView()
        default:
            EmptyView()
        }
    }
}
