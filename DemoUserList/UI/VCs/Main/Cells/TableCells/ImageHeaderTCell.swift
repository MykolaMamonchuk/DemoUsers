//
//  ImageHeaderTCell.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import UIKit

class ImageHeaderTCell: BaseTVCell {
    // MARK: IBOurtlets

    @IBOutlet var headerImage: UIImageView!

    // MARK: Initialization

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: Public methods

    func configure(_ model: UserML?) {
        headerImage.loadImage(with: model?.mediumImg, nil)
    }
}
