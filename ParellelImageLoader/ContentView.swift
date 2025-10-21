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
            DemoView(.callback)
                .tabItem {
                    Label("Callback", systemImage: "arrow.triangle.2.circlepath")
                }
            DemoView(.combine)
                .tabItem {
                    Label("Combine", systemImage: "link")
                }
            DemoView(.asyncType)
                .tabItem {
                    Label("Async", systemImage: "bolt")
                }
        }
    }
}

#Preview {
    ContentView()
}
