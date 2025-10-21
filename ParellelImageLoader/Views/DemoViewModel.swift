//
//  DemoViewModel.swift
//  ParellelImageLoader
//
//  Created by Sylvan  on 21/10/2025.
//

import Combine
import UIKit

@MainActor
final class DemoViewModel: ObservableObject {
    @Published private(set) var images: [UIImage] = []
    @Published private(set) var isLoading = false

    private let dataSource = NetworkImageDataSource()
    private let urls = ImageURL.urls
    private var cancellables = Set<AnyCancellable>()

    func loadUsingCallback() {
        isLoading = true
        images.removeAll()
        print("[Callback] started")

        let loader = CallbackImageLoader(dataSource: dataSource)
        loader.loadImages(from: urls) { [weak self] images in
            print("[Callback] completed")
            self?.images = images
            self?.isLoading = false
        }
    }

    func loadUsingCombine() {
        isLoading = true
        images.removeAll()
        print("[Combine] started")

        let loader = CombineImageLoader(dataSource: dataSource)
        loader.loadImages(from: urls)
            .sink { [weak self] images in
                print("[Combine] completed")
                self?.images = images
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }

    func loadUsingAsync() {
        isLoading = true
        images.removeAll()
        print("[Async] started")

        Task {
            let loader = AsyncImageLoader(dataSource: dataSource)
            self.images = await loader.loadImages(from: self.urls)
            self.isLoading = false
            print("[Async] completed")
        }
    }
}
