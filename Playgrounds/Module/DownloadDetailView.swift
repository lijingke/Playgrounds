//
//  DownloadDetailView.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/14.
//

import Foundation
import Tiercel

class DownloadDetailView: UIView {
    // MARK: Life Cycle

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        addListener()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    lazy var totalTasksLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var totalProgressLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var totalSpeedLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var timeRemainingLabel: UILabel = {
        let label = UILabel()
        return label
    }()
}

// MARK: - UI

extension DownloadDetailView {
    private func addListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(noti:)), name: .downloadStatusChanged, object: nil)
    }
    
    @objc private func handleNotification(noti: NSNotification) {
        if let sessionManager = noti.object as? SessionManager {
            totalTasksLabel.text = "总任务：\(sessionManager.succeededTasks.count)/\(sessionManager.tasks.count)"
            totalSpeedLabel.text = "总速度：\(sessionManager.speedString)"
            timeRemainingLabel.text = "剩余时间： \(sessionManager.timeRemainingString)"
            let per = String(format: "%.2f", sessionManager.progress.fractionCompleted)
            totalProgressLabel.text = "总进度： \(per)"
        }
    }
}

// MARK: - UI

extension DownloadDetailView {
    private func setupUI() {
        addSubviews([totalTasksLabel, totalProgressLabel, totalSpeedLabel, timeRemainingLabel])
        totalTasksLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(15)
        }
        totalProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(totalTasksLabel)
            make.right.equalToSuperview().offset(-15)
        }
        totalSpeedLabel.snp.makeConstraints { make in
            make.top.equalTo(totalTasksLabel.snp.bottom).offset(5)
            make.left.equalTo(totalTasksLabel)
            make.bottom.equalToSuperview().offset(-10)
        }
        timeRemainingLabel.snp.makeConstraints { make in
            make.top.equalTo(totalSpeedLabel)
            make.right.equalToSuperview().offset(-15)
        }
    }
}
