//
//  ImageDataSource.swift
//  ParellelImageLoader
//
//  Created by Sylvan  on 21/10/2025.
//

import UIKit

enum ImageURL {
    static var urls: [URL] {
        [
            URL(string: "https://picsum.photos/id/10/300/300")!,
            URL(string: "https://picsum.photos/id/20/300/300")!,
            URL(string: "https://picsum.photos/id/30/300/300")!
        ]
    }
}

protocol ImageDataSource: AnyObject {
    func fetchImage(url: URL, completion: @escaping (UIImage) -> Void)
    func fetchImage(url: URL) async -> UIImage
}

final class NetworkImageDataSource: ImageDataSource {
    func fetchImage(url: URL, completion: @escaping (UIImage) -> Void) {
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                print("[Network] image fetched")
                completion(image)
            } else {
                print("[Network] no image data")
                completion(UIImage())
            }
        }
    }

    func fetchImage(url: URL) async -> UIImage {
        await withCheckedContinuation { continuation in
            self.fetchImage(url: url) { image in
                continuation.resume(returning: image)
            }
        }
    }
}
