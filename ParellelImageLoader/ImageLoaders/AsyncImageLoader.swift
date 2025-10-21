//
//  AsyncImageLoader.swift
//  ParellelImageLoader
//
//  Created by Sylvan  on 21/10/2025.
//

import UIKit

final class AsyncImageLoader {
    private let dataSource: ImageDataSource

    init(dataSource: ImageDataSource) {
        self.dataSource = dataSource
    }

    func loadImages(from urls: [URL]) async -> [UIImage] {
        await withTaskGroup(of: UIImage?.self) { group in
            for url in urls {
                group.addTask { [weak dataSource] in
                    await dataSource?.fetchImage(url: url)
                }
            }

            var images: [UIImage] = []
            for await image in group {
                images.append(image ?? UIImage())
            }

            return images
        }
    }
}
