//
//  RemoteMainView.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI

struct RemoteMainView: View {
    @StateObject private var viewModel: RemoteMainViewModel
    
    init(viewModel: RemoteMainViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("Helllooo")
        }
        .background(Color.red)
    }
}
