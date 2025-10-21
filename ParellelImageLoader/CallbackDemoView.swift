//
//  CallbackDemoView.swift
//  ParellelImageLoader
//
//  Created by Sylvan  on 21/10/2025.
//

import SwiftUI

struct CallbackDemoView: View {
    @State private var images: [UIImage] = []

    var body: some View {
        VStack {
            if images.isEmpty {
                ProgressView("Loading images...")
                    .task {
                        CallbackImageLoader().loadImages(from: ImageURL.urls) { images in
                            self.images = images
                        }
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
}
