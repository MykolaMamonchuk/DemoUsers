//
//  ExtUITableView.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import UIKit

extension UITableView {
    func dequRCell(_ withIdentifier: String, _ indexPath: IndexPath) -> UITableViewCell {
        dequeueReusableCell(withIdentifier: withIdentifier, for: indexPath)
    }
}
