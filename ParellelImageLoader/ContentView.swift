//
//  ContentView.swift
//  ParellelImageLoader
//
//  Created by Sylvan  on 21/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CallbackDemoView()
                .tabItem {
                    Label("Callback", systemImage: "arrow.triangle.2.circlepath")
                }
            CombineDemoView()
                .tabItem {
                    Label("Combine", systemImage: "link")
                }
            AsyncDemoView()
                .tabItem {
                    Label("Async", systemImage: "bolt")
                }
        }
    }
}

#Preview {
    ContentView()
}
