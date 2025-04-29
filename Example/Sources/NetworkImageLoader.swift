//
//  NetworkImageLoader.swift
//  ImageDownloader_megrigoryan
//
//  Created by Mesrop Grigoryan on 09.04.25.
//

import UIKit

public enum NetworkImageLoader {
    public static func downloadImageFromURL(from url: URL, completion: @escaping @Sendable (Result<UIImage, Error>) -> Void) {
        URLSession.shared.downloadTask(with: url) { tempURL, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            guard let tempURL,
                  let data = try? Data(contentsOf: tempURL),
                  let image = UIImage(data: data) else {
                completion(.failure(ImageDownloaderError.failedToLoadImage))
                return
            }
            completion(.success(image))
        }.resume()
    }
}
