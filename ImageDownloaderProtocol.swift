//
//  ImageDownloader.swift
//  GDImageLoader_iOS_megrigoryan
//
//  Created by Mesrop Grigoryan on 21.03.25.
//

import UIKit

@MainActor
public protocol ImageDownloaderProtocol {
    static func downloadImage(
        from url: URL,
        to imageView: UIImageView,
        completion: @escaping @Sendable (Result<UIImage, Error>) -> Void
    )
    
    static func downloadImage(
        from urlString: String,
        to imageView: UIImageView,
        completion: @escaping @Sendable (Result<UIImage, Error>) -> Void
    )
}
