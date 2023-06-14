//
//  ChangeAppICONVC.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/14.
//

import Foundation

class ChangeAppICONVC: UIViewController {
    // MARK: Property

    var dataSource: [ICONModel] = []

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        setupUI()
        creatData()
    }

    // MARK: Lazy Get

    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 75, height: 75)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        return layout
    }()

    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        view.register(ChangeAppICONCell.self, forCellWithReuseIdentifier: ChangeAppICONCell.identifier)
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
}

// MARK: - Event

extension ChangeAppICONVC {
    func changeICON(iconName: String) {
        if !UIApplication.shared.supportsAlternateIcons {
            return
        }
        if UIApplication.shared.alternateIconName == iconName {
            let alert = UIAlertController(title: nil, message: "App图标已是当前选中的图标，无需更换", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "知道了", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        UIApplication.shared.setAlternateIconName(iconName) { error in
            if let error {
                print(error.localizedDescription)
            }else {
                UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
            }
        }
    }
    
    //MARK: alert message
    func alert(str: String) {
        let alert = UIAlertController.init(title: "提示", message: str, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "ok", style: .cancel) { (action: UIAlertAction) in
            print("关闭弹出框")
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Data

extension ChangeAppICONVC {
    private func creatData() {
        let iconNameDicArr: [[String: String]] = [
            ["name": "しんのすけ", "chsName": "野原新之助"],
            ["name": "かざまくん", "chsName": "风间彻"],
            ["name": "ネネちゃん", "chsName": "樱田妮妮"],
            ["name": "まさおくん", "chsName": "佐藤正男"],
            ["name": "ボーちゃん", "chsName": "阿呆"],
        ]
        dataSource = iconNameDicArr.compactMap({ICONModel.deserialize(from: $0)})
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate

extension ChangeAppICONVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = dataSource[indexPath.row]
        changeICON(iconName: data.chsName ?? "")
    }
}

// MARK: - UICollectionViewDataSource

extension ChangeAppICONVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChangeAppICONCell.identifier, for: indexPath) as! ChangeAppICONCell
        let data = dataSource[indexPath.row]
        cell.configData(data)
        return cell
    }
}

// MARK: - Event

extension ChangeAppICONVC {}

// MARK: - UI

extension ChangeAppICONVC {
    private func setupUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
