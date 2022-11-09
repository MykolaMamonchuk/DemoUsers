//
//  DetailVC.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import UIKit

class DetailVC: UIViewController {
    // MARK: USER IBOutlets (If needed)

    // MARK: -

    @IBOutlet var tableView: UITableView!

    // MARK: -

    // MARK: Public variable

    // MARK: -

    public var userModel: UserML?

    // MARK: -

    // MARK: View Lifecycle (If needed)

    // MARK: -

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    private func configureUI() {
        navigationSettings()
        configureCells()
    }

    private func navigationSettings() {
        defaultColorNavBar()

        navigationItem.title = userModel?.name
    }

    @objc func navigationAction() {}

    // MARK: -

    // MARK: ADDITIONAL PUBLIC HELPERS

    // MARK: -

    public func configureCells() {
        PostTCell.register(tableView)
        ImageHeaderTCell.register(tableView)

        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = .zero
        }
    }
}

extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        userModel?.posts?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequRCell(PostTCell.cellIdentifier, indexPath) as? PostTCell else { fatalError() }

        guard let model = userModel?.posts?[indexPath.row] else { fatalError() }
        cell.configure(model)
        return cell
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        170.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let indexPath = IndexPath(row: 0, section: section)
        guard let cell = tableView.dequRCell(ImageHeaderTCell.cellIdentifier, indexPath) as? ImageHeaderTCell else { fatalError() }

        cell.configure(userModel)
        return cell
    }
}
