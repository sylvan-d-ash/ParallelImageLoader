//
//  AsyncDemoView.swift
//  ParellelImageLoader
//
//  Created by Sylvan  on 21/10/2025.
//

import SwiftUI

struct AsyncDemoView: View {
    @State private var images = [UIImage]()

    var body: some View {
        if images.isEmpty {
            ProgressView("Loading images...")
                .task {
                    print("Async start")
                    images = await AsyncImageLoader().loadImages(from: ImageURL.urls)
                    print("Async end")
                }
        } else {
            VStack {
                ForEach(images, id: \.self) {
                    Image(uiImage: $0)
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}
