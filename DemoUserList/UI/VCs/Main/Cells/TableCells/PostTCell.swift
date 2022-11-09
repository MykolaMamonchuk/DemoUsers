//
//  PostTCell.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import UIKit

class PostTCell: BaseTVCell {
    // MARK: IBOurtlets

    @IBOutlet var titleLBL: UILabel!
    @IBOutlet var descLBL: UILabel!

    // MARK: Initialization

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: Public methods

    func configure(_ model: PostML) {
        titleLBL.text = model.title
        descLBL.text = model.body
    }
}
