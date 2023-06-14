//
//  HomeView.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/13.
//

import Foundation
import UIKit

protocol HomeViewDelegate: NSObjectProtocol {
    func itemClicked(item: Int)
}

class HomeView: UIView {
    // MARK: Property

    weak var delegate: HomeViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lazy Get

    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        return table
    }()
}

// MARK: - UI

extension HomeView {
    private func setupUI() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.itemClicked(item: indexPath.row)
    }
}

// MARK: - UITableViewDataSource

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier)!
        var content = cell.defaultContentConfiguration()
        // Configure content.
        content.image = UIImage(systemName: "figure.stand.line.dotted.figure.stand")
        content.text = "\(indexPath.row)"

        // Customize appearance.
        content.imageProperties.tintColor = .random

        cell.contentConfiguration = content
        return cell
    }
}
