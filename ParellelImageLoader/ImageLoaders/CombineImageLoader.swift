//
//  CombineImageLoader.swift
//  ParellelImageLoader
//
//  Created by Sylvan  on 21/10/2025.
//

import Combine
import UIKit

final class CombineImageLoader {
    private let dataSource: ImageDataSource

    init(dataSource: ImageDataSource) {
        self.dataSource = dataSource
    }

    func loadImages(from urls: [URL]) -> AnyPublisher<[UIImage], Never> {
        let publishers = urls.map { url in
            Future<UIImage, Never> { [weak dataSource] promise in
                dataSource?.fetchImage(url: url) { image in
                    promise(.success(image))
                }
            }
        }

        return Publishers.MergeMany(publishers)
            .collect()
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
