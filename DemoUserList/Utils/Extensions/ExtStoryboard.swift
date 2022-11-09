//
//  ExtStoryboard.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import UIKit

extension UIStoryboard {
    func initVC(_ identifier: String) -> UIViewController {
        return instantiateViewController(identifier: identifier)
    }
}
