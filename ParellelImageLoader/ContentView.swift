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
            CombineDemoView()
                .tabItem {
                    Label("Combine", systemImage: "link")
                }
            CallbackDemoView()
                .tabItem {
                    Label("Callback", systemImage: "arrow.triangle.2.circlepath")
                }
        }
    }
}

#Preview {
    ContentView()
}
