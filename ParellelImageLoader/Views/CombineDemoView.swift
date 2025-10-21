//
//  CombineDemoView.swift
//  ParellelImageLoader
//
//  Created by Sylvan  on 21/10/2025.
//

import SwiftUI
import Combine

struct CombineDemoView: View {
    @State private var images: [UIImage] = []
    @State private var cancellables = Set<AnyCancellable>()

    var body: some View {
        VStack {
            if images.isEmpty {
                ProgressView("Loading Images...")
                    .onAppear {
                        print("Loading start...")
                        CombineImageLoader().loadImages(from: ImageURL.urls)
                            .receive(on: DispatchQueue.main)
                            .sink { images in
                                print("loading complete")
                                self.images = images
                            }
                            .store(in: &cancellables)
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
