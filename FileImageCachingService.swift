//
//  FileImageCachingService.swift
//  ImageDownloader_megrigoryan
//
//  Created by Mesrop Grigoryan on 09.04.25.
//

import UIKit

public struct FileImageCachingService: ImageCachingServiceProtocol {
    private let fileManager = FileManager.default
    private let cacheDirectory: URL

    public init() {
        self.cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("GDImageCache", isDirectory: true)

        if !fileManager.fileExists(atPath: cacheDirectory.path) {
            try? fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
        }
    }

    // ✅ Base64 encoded file name (safe and unique)
    func fileURL(for url: URL) -> URL {
        let base64FileName = Data(url.absoluteString.utf8).base64EncodedString()
        return cacheDirectory.appendingPathComponent(base64FileName)
    }

    public func saveImage(_ image: UIImage, for url: URL) throws {
        let fileURL = self.fileURL(for: url)
        guard let data = image.pngData() else {
            throw ImageCachingError.imageConversionFailed
        }
        try data.write(to: fileURL)
    }

    public func loadImage(for url: URL) -> UIImage? {
        let fileURL = self.fileURL(for: url)
        guard let data = try? Data(contentsOf: fileURL) else {
            print("❌ Image not found in cache for: \(url)")
            return nil
        }

        print("✅ Loaded image from cache: \(fileURL.lastPathComponent)")
        return UIImage(data: data)
    }

    public func deleteImage(for url: URL) throws {
        let fileURL = self.fileURL(for: url)
        if fileManager.fileExists(atPath: fileURL.path) {
            try fileManager.removeItem(at: fileURL)
        }
    }

    public func clearCache() throws {
        let contents = try fileManager.contentsOfDirectory(at: cacheDirectory, includingPropertiesForKeys: nil)
        for fileURL in contents {
            try fileManager.removeItem(at: fileURL)
        }
    }
}

public enum ImageCachingError: Error {
    
    case imageConversionFailed
}
