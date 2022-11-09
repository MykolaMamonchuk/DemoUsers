//
//  MainVC.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import UIKit

class MainVC: UIViewController {
    // MARK: USER IBOutlets (If needed)

    // MARK: -

    @IBOutlet var tableView: UITableView!

    // MARK: -

    // MARK: Private variable

    // MARK: -

    private var userList = [UserML]()

    // MARK: -

    // MARK: View Lifecycle (If needed)

    // MARK: -

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        prepareData { _ in }
    }

    private func configureUI() {
        navigationSettings()
        configureCells()
    }

    private func navigationSettings() {
        defaultColorNavBar()

        navigationController?.navigationItem.hidesBackButton = true
        navigationItem.title = "users".localized()
    }

    @objc func navigationAction() {}

    // MARK: -

    // MARK: ADDITIONAL PUBLIC HELPERS

    // MARK: -

    public func configureCells() {
        UserDefaultTCell.register(tableView)
    }

    // MARK: -

    // MARK: ADDITIONAL PRIVATE HELPERS

    // MARK: -

    private func prepareData(_ completion: @escaping AnyBlock) {
        SGH.sI.startIndicator()

        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let group = DispatchGroup()

            group.enter()
            self?.getUsers { _ in group.leave() }

            group.wait()

            DispatchQueue.main.async { [weak self] in
                SGH.sI.stopIndicator()
                self?.tableView.reloadData()
                completion(true)
            }
        }
    }

    private func getUsers(_ completion: @escaping AnyBlock) {
        APIManager.sI().getUsers { [weak self] response in
            switch response {
            case let .success(result):
                self?.userList = result

                self?.getPosts { _ in completion(false) }

            case let .failure(error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }

    private func getPosts(_ completion: @escaping AnyBlock) {
        APIManager.sI().getUsersPosts { [weak self] response in
            switch response {
            case let .success(result):

//               It's without original order from the server side, if need origin sort need add other logic
                let result = Array(Set(result))

                self?.userList.forEach { user in
                    user.posts = result.filter { $0.userId == user.userId }
                }
                completion(false)
            case let .failure(error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        userList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequRCell(UserDefaultTCell.cellIdentifier, indexPath) as? UserDefaultTCell else { fatalError() }

        cell.configure(userList[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let vc = kMainSB.initVC(ViewControllerIDs.MainSB.kDetailVC) as? DetailVC {
            vc.userModel = userList[indexPath.row]
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
