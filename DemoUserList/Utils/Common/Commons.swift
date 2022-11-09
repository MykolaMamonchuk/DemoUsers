//
//  Commons.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import Foundation
import UIKit

public enum UDKey {
    static let UserAppMode = "com.default.app.user.app.mode"
}

//  Storyboard constant
let kMainSB = UIStoryboard(name: "Main", bundle: nil)
let kSettingsSB = UIStoryboard(name: "Settings", bundle: nil)

enum ViewControllerIDs {
    enum MainSB {
        static let kMainVC = "MainVC"
        static let kDetailVC = "DetailVC"
    }

    enum SettingsSB {
        static let kSettingsVC = "SettingsVC"
    }
}
