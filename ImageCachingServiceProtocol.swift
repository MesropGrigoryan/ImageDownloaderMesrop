//
//  ImageCachingServiceProtocol.swift
//  ImageDownloader_megrigoryan
//
//  Created by Mesrop Grigoryan on 09.04.25.
//

import UIKit

public protocol ImageCachingServiceProtocol {
    func saveImage(_ image: UIImage, for url: URL) throws
    func loadImage(for url: URL) -> UIImage?
    func deleteImage(for url: URL) throws
    func clearCache() throws
}
