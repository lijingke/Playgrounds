//
//  ChangeAppICONCell.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/14.
//

import Foundation
class ChangeAppICONCell: UICollectionViewCell {
    // MARK: Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }

    // MARK: Lazy Get

    lazy var iconView: UIImageView = {
        let view = UIImageView()
        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
}

// MARK: - Data

extension ChangeAppICONCell {
    func configData(_ model: ICONModel) {
        iconView.image = UIImage(named: model.name ?? "")
        titleLabel.text = model.name
    }
}

// MARK: - UI

extension ChangeAppICONCell {
    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubviews([iconView, titleLabel])
        iconView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
