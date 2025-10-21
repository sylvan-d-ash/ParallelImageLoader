//
//  AsyncImageLoader.swift
//  ParellelImageLoader
//
//  Created by Sylvan  on 21/10/2025.
//

import UIKit

final class AsyncImageLoader {
    func loadImages(from urls: [URL]) async -> [UIImage] {
        await withTaskGroup(of: UIImage?.self) { group in
            for url in urls {
                group.addTask {
                    do {
                        let (data, _) = try await URLSession.shared.data(from: url)
                        return UIImage(data: data)
                    } catch {
                        return nil
                    }
                }
            }

            var images = [UIImage]()
            var counter = 1
            for await image in group {
                let image = image ?? UIImage(systemName: "arrow.triangle.\(counter).circlepath")
                images.append(image ?? UIImage())
                counter += 1
            }

            return images
        }
    }
}
