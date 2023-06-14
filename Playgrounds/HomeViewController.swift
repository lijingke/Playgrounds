//
//  HomeViewController.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/12.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.navigationController?.navigationBar.isTranslucent = false
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        setupUI()
    }

    // MARK: Lazy Get

    lazy var mainView: HomeView = {
        let view = HomeView()
        view.delegate = self
        return view
    }()
}

// MARK: - HomeViewDelegate

extension HomeViewController: HomeViewDelegate {
    func itemClicked(item: Int) {
        let vc = DownloadViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UI

extension HomeViewController {
    private func setupUI() {
        title = "Playgrounds"
        view.backgroundColor = .white
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
