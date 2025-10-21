//
//  CombineImageLoader.swift
//  ParellelImageLoader
//
//  Created by Sylvan  on 21/10/2025.
//

import Combine
import UIKit

final class CombineImageLoader {
    func loadImages(from urls: [URL]) -> AnyPublisher<[UIImage], Never> {
        let publishers = urls.map { url in
            URLSession.shared.dataTaskPublisher(for: url)
                .map { UIImage(data: $0.data)! }
                .replaceError(with: UIImage())
        }

        return Publishers.MergeMany(publishers)
            .collect()
            .eraseToAnyPublisher()
    }
}
