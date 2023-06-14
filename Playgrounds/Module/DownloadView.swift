//
//  DownloadView.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/14.
//

import Foundation
import SDWebImage

class DownloadView: UIView {
    
    // MARK: Property
    var dataSource: [SportDataExerciseDetailVideoMetasVideos] = []
    
    // MARK: Lify Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lazy Get
    
    lazy var detailView: DownloadDetailView = {
        let view = DownloadDetailView()
        return view
    }()

    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        return table
    }()
    
    lazy var startDownloadBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("开始下载", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(hexString: "#FF6770")
        btn.titleLabel?.font = UIFont.medium(16)
        btn.layer.cornerRadius = 22
        btn.addTarget(self, action: #selector(startBtnAction), for: .touchUpInside)
        return btn
    }()
}


// MARK: - UITableViewDelegate

extension DownloadView {
    @objc private func startBtnAction() {
        
    }
}

// MARK: - UITableViewDelegate

extension DownloadView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension DownloadView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier)!
        let data = dataSource[indexPath.row]
        var content = cell.defaultContentConfiguration()
        // Configure content.
        content.image = UIImage(systemName: "square.and.arrow.down")
        content.text = data.name
        content.secondaryText = data.videoUrl
        // Customize appearance.
        content.imageProperties.tintColor = .random
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - Event

extension DownloadView {
    public func refreshData(_ data: [SportDataExerciseDetailVideoMetasVideos]) {
        self.dataSource = data
        tableView.reloadData()
    }
}


// MARK: - UI

extension DownloadView {
    private func setupUI() {
        backgroundColor = .systemGroupedBackground
        addSubviews([detailView, tableView, startDownloadBtn])
        detailView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(detailView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(startDownloadBtn.snp.top).offset(-10)
        }
        startDownloadBtn.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.left.equalToSuperview().offset(38)
            make.right.equalToSuperview().offset(-38)
            make.height.equalTo(44)
        }
    }
}
