//
//  CallbackImageLoader.swift
//  ParellelImageLoader
//
//  Created by Sylvan  on 21/10/2025.
//

import UIKit

final class CallbackImageLoader {
    func loadImages(from urls: [URL], completion: @escaping ([UIImage]) -> Void) {
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "callback.image.loader", attributes: .concurrent)
        var images = [UIImage]()

        for url in urls {
            group.enter()
            queue.async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    images.append(image)
                }
                group.leave()
            }
        }

        group.notify(queue: .main) {
            completion(images)
        }
    }
}
