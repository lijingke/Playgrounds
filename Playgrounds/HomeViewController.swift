//
//  HomeViewController.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/12.
//

import Foundation
import UIKit

import SnapKit

class HomeViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        MBProgressManager.showLoadingOrdinary("Loading")
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            MBProgressManager.showHUD(withSuccess: "加载成功")
//        }
        getDataSource()
        configureNav()
        setupUI()
    }

    var headViewTitles: [String] = []

    var dataSource: [[HomeDataEntity]] = []

    // MARK: Lazy Get

    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.delegate = self
        table.dataSource = self
        return table
    }()
}

// MARK: - Data

extension HomeViewController {
    private func getDataSource() {
        headViewTitles = ["Playground"]

        for title in headViewTitles {
            var dicArray: [[CellInfoEnum: String]] = []
            switch title {
            case "Playground":
                dicArray = [
                    [.cellName: "Download", .className: "DownloadViewController"],
                    [.cellName: "Change ICON", .className: "ChangeAppICONVC"]
                ]
            default:
                break
            }
            let entities = dicArray.compactMap { HomeDataEntity($0) }
            if entities.count > 0 {
                dataSource.append(entities)
            }
        }
        tableView.reloadData()
    }
}

// MARK: - UI

extension HomeViewController {
    private func configureNav() {
        navigationItem.title = "瓦西里的百宝箱"
        edgesForExtendedLayout = []
        navigationController?.navigationBar.isTranslucent = false
    }

    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let head = UITableViewHeaderFooterView()
        head.textLabel?.text = headViewTitles[section]
        return head
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let entity = dataSource[indexPath.section][indexPath.row]
        let className = entity.className ?? ""
        if entity.pushType == "pop" {
            if let vc = getVCFromString(className) {
                DispatchQueue.main.async { [weak self] in
                    self?.present(vc, animated: true, completion: nil)
                }
            }
        } else {
            if let vc = getVCFromString(className) {
                vc.navigationItem.title = entity.cellName
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dataSource[indexPath.section][indexPath.row].cellName
        return cell
    }
}
