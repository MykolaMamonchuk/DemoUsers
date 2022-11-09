//
//  ExtUIViewController.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import UIKit

extension UIViewController {
    public func clearNavStyle() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Colors.Title2, .font: UIFont.systemFont(ofSize: 17, weight: .bold)]

        navigationController?.navigationBar.tintColor = .black // Button Color
        navigationController?.navigationBar.barTintColor = Colors.AccentM // Main Background View
        defaultNavData()
    }

    func defaultColorNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Colors.AccentM
        appearance.titleTextAttributes = [.foregroundColor: Colors.Title2, .font: UIFont.systemFont(ofSize: 17, weight: .bold)]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationController?.navigationBar.tintColor = Colors.Title2 // Button Color

        defaultNavData()
    }

    func defaultNavData() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
