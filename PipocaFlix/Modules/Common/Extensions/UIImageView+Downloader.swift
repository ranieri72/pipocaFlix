//
//  UIImageView+Downloader.swift
//  PipocaFlix
//
//  Created by Ranieri Aguiar on 26/10/22.
//

import UIKit

extension UIImageView {
    func download(path: String) {
        let imageBaseURL = Bundle.main.object(forInfoDictionaryKey: "ImageBaseURL") as? String ?? ""
        let url = imageBaseURL + path
        ImageDownloader.shared.downloadImage(with: url, completionHandler: { (downloadedImage, cached) in
            self.image = downloadedImage
        }, placeholderImage: UIImage(named: "placeholder"))
    }
}
