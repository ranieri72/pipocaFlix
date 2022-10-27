//
//  UIImageView+Downloader.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 26/10/22.
//

import UIKit

extension UIImageView {
    func download(path: String) {
        let url = "https://image.tmdb.org/t/p/w342" + path
        ImageDownloader.shared.downloadImage(with: url, completionHandler: { (downloadedImage, cached) in
            self.image = downloadedImage
        }, placeholderImage: UIImage(named: "placeholder"))
    }
}
