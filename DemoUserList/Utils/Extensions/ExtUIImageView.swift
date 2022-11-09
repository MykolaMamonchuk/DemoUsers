//
//  ExtUIImageView.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import Kingfisher
import UIKit

extension UIImageView {
    func loadImage(with aLink: String?, _ aPlaceholder: UIImage?) {
        kf.cancelDownloadTask()
        if let urlStr = aLink, let url = URL(string: urlStr) {
            DispatchQueue.main.async {
                self.kf.indicatorType = .activity
                self.kf.setImage(with: url, placeholder: aPlaceholder, options: [.transition(.fade(2))], completionHandler: { _ in
                    self.alpha = 1
                })
            }
        } else {
            image = aPlaceholder
        }
    }
}
