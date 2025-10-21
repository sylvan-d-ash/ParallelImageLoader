//
//  CallbackImageLoader.swift
//  ParellelImageLoader
//
//  Created by Sylvan  on 21/10/2025.
//

import UIKit

final class CallbackImageLoader {
    private let dataSource: ImageDataSource

    init(dataSource: ImageDataSource) {
        self.dataSource = dataSource
    }

    func loadImages(from urls: [URL], completion: @escaping ([UIImage]) -> Void) {
        let group = DispatchGroup()
        var images: [UIImage] = []

        for url in urls {
            group.enter()
            dataSource.fetchImage(url: url) { image in
                images.append(image)
                group.leave()
            }
        }

        group.notify(queue: .main) {
            completion(images)
        }
    }
}
