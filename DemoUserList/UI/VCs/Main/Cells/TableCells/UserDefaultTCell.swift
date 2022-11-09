//
//  UserDefaultTCell.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import UIKit

class UserDefaultTCell: BaseTVCell {
    // MARK: IBOurtlets

    @IBOutlet var userNameLBL: UILabel!
    @IBOutlet var userPostsInfoLBL: UILabel!
    @IBOutlet var userAvatarImage: UIImageView!

    // MARK: Initialization

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: Public methods

    func configure(_ model: UserML) {
        userNameLBL.text = model.name

        let userPostCount = (model.posts?.count ?? 0)
        let plrText = SGH.sI.pluralForm(userPostCount, "post".localized(), "posts".localized(), "posts".localized())
        userPostsInfoLBL.text = "user_count_posts".localized("\(userPostCount) \(plrText)")

        userAvatarImage.loadImage(with: model.mediumImg, nil)
    }
}
