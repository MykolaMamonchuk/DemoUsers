//
//  SettingsVC.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import UIKit

class SettingsVC: UITableViewController {
    // MARK: USER IBOutlets (If needed)

    // MARK: -

    @IBOutlet var darkModeSwitch: UISwitch!

    // MARK: -

    // MARK: View Lifecycle (If needed)

    // MARK: -

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    private func configureUI() {
        navigationSettings()
        darkModeSwitch.isOn = SGH.sI.isDarkMode == .dark
    }

    private func navigationSettings() {
        defaultColorNavBar()

        navigationController?.navigationItem.hidesBackButton = true
        navigationItem.title = "Settings"
    }

    @objc func navigationAction() {}

    // MARK: -

    // MARK: USER IBActions (If needed)

    // MARK: -

    @IBAction func onChangeDarkModeStateAction(_ sender: UISwitch) {
        SGH.sI.isDarkMode = sender.isOn ? .dark : .light
        if #available(iOS 13.0, *) {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = SGH.sI.isDarkMode
        }
    }
}
