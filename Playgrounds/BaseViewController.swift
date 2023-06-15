//
//  BaseViewController.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/15.
//

import Foundation
import WXNavigationBar

class BaseViewController: UIViewController {
    // MARK: Property

    var titleLabel = UILabel()
    var backBlock: (() -> Void)?
    var isHideBackBtn: Bool = false {
        didSet {
            navigationItem.leftBarButtonItem = isHideBackBtn ? nil : leftBarBtn
        }
    }

    override var title: String? {
        didSet {
            guard let titleStr = self.title else {
                return
            }
            if titleStr.count > 10 {
                self.titleLabel.text = "\(String(describing: titleStr.getSubString(startIndex: 0, endIndex: 9)))..."
            } else {
                self.titleLabel.text = titleStr
            }
        }
    }

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    private func setupNavi() {
        navigationItem.leftBarButtonItem = leftBarBtn
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "#323232")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        if #available(iOS 15, *) {
            let app = UINavigationBarAppearance()
            app.configureWithOpaqueBackground() // 重置背景和阴影颜色
            app.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                NSAttributedString.Key.foregroundColor: UIColor.black,
            ]
            self.navigationController?.navigationBar.standardAppearance = app // 常规页面
        }
        if navigationController?.viewControllers.count ?? 0 <= 1 {
            navigationItem.leftBarButtonItem?.isHidden = true
        } else {
            navigationItem.leftBarButtonItem?.isHidden = false
        }
    }

    lazy var leftBarBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backToPrevious))
        btn.image = UIImage(systemName: "arrow.backward")
        return btn
    }()

    @objc private func backToPrevious() {
        if let block = backBlock {
            block()
        } else {
            navigationController?.popViewController(animated: true)
        }
    }

    #if DEBUG // 摇一摇
        override func motionBegan(_: UIEvent.EventSubtype, with _: UIEvent?) {
            LogUtil.log("摇一摇")
            //        FLEXManager.shared.showExplorer()
        }
    #endif

    /// 隐藏导航栏
    func hiddenNavigationBar(_ hidden: Bool) {
        wx_navigationBar.isHidden = hidden
        navigationController?.navigationBar.isHidden = hidden
        navigationController?.setNavigationBarHidden(hidden, animated: false)
    }
}
