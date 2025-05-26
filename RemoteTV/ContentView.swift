//
//  ContentView.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 26.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Привет, мир")
                .bodyStyle()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
