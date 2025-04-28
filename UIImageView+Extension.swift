//
//  UIImageVIew+Extension.swift
//  GDImageLoader_iOS_megrigoryan
//
//  Created by Mesrop Grigoryan on 21.03.25.
//

import UIKit

public extension UIImageView {
    func setImage(
        from url: URL,
        completion: @escaping @Sendable (Result<UIImage, Error>) -> Void
    ) {
        // Call the image downloader
        ImageDownloader.downloadImage(from: url, to: self, completion: completion)
    }
    
    // Set image using a URL string
    func setImage(
        from urlString: String,
        completion: @escaping @Sendable (Result<UIImage, Error>) -> Void
    ) {
        // Call the image downloader
        ImageDownloader.downloadImage(from: urlString, to: self, completion: completion)
    }
}
