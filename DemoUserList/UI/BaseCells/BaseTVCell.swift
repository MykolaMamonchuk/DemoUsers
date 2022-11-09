//
//  BaseTVCell.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import UIKit

class BaseTVCell: UITableViewCell {
    // MARK: - Class Methods

    class var className: String {
        return String(describing: self)
    }

    class var cellIdentifier: String {
        return String(describing: self)
    }

    class func register(_ aView: UITableView) {
        let nib = UINib(nibName: className, bundle: nil)
        aView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
}
