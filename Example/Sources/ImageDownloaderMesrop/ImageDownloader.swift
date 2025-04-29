//
//  ImageDownloader.swift
//  GDImageLoader_iOS_megrigoryan
//
//  Created by Mesrop Grigoryan on 21.03.25.
//

import UIKit

@MainActor
public struct ImageDownloader: ImageDownloaderProtocol {
    private static var cacheService: ImageCachingServiceProtocol = FileImageCachingService()
    
    enum ImageLoadingStatus {
        case loading([((Result<UIImage, Error>) -> Void)])
        case loaded(toURL: URL)
        case failed(Error)
    }

    private static var imageDownloads: [URL: ImageLoadingStatus] = [:]

    public init() {}

    public static func downloadImage(
        from url: URL,
        to imageView: UIImageView,
        completion: @escaping @Sendable (Result<UIImage, Error>) -> Void
    ) {
        // Check disk cache
        if let cachedImage = cacheService.loadImage(for: url) {
            imageView.image = cachedImage
            completion(.success(cachedImage))
            return
        }

        // Check if download is already in progress
        if #available(iOS 13.0, *) {
            Task { @MainActor in
                switch imageDownloads[url] {
                case .loading(var completions):
                    completions.append(completion)
                    imageDownloads[url] = .loading(completions)
                    return
                    
                case .loaded(let fileURL):
                    if let data = try? Data(contentsOf: fileURL),
                       let image = UIImage(data: data) {
                        imageView.image = image
                        completion(.success(image))
                    } else {
                        imageDownloads.removeValue(forKey: url)
                        downloadImage(from: url, to: imageView, completion: completion)
                    }
                    return
                    
                case .failed:
                    imageDownloads.removeValue(forKey: url)
                    break // fall through to restart download
                    
                case .none:
                    break
                }
                
                // Start new download
                imageDownloads[url] = .loading([completion])
            }
        } else {
            // Fallback on earlier versions
        }

        NetworkImageLoader.downloadImageFromURL(from: url) { result in
            if #available(iOS 13.0, *) {
                Task { @MainActor in
                    let currentStatus = imageDownloads[url]
                    
                    switch result {
                    case .success(let image):
                        try? cacheService.saveImage(image, for: url)
                        let fileURL = FileImageCachingService().fileURL(for: url)
                        
                        imageView.image = image
                        
                        imageDownloads[url] = .loaded(toURL: fileURL)
                        
                        if case .loading(let completions) = currentStatus {
                            completions.forEach { $0(.success(image)) }
                        }
                        
                    case .failure(let error):
                        imageDownloads[url] = .failed(error)
                        
                        if case .loading(let completions) = currentStatus {
                            completions.forEach { $0(.failure(error)) }
                        }
                    }
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }

    public static func downloadImage(
        from urlString: String,
        to imageView: UIImageView,
        completion: @escaping @Sendable (Result<UIImage, Error>) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            completion(.failure(ImageDownloaderError.invalidURL))
            return
        }
        downloadImage(from: url, to: imageView, completion: completion)
    }
}

// Custom error types for clarity
public enum ImageDownloaderError: Error {
    case invalidURL
    case failedToLoadImage
}
