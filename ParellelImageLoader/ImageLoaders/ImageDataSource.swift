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
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(UIImage())
            }
        }
    }

    func fetchImage(url: URL) async -> UIImage {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return UIImage(data: data) ?? UIImage()
        } catch {
            print("Error: \(error.localizedDescription)")
            return UIImage()
        }
    }
}
