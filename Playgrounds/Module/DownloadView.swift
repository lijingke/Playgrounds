//
//  DownloadView.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/14.
//

import Foundation
import SDWebImage
import Tiercel

protocol DownloadViewDelegate: NSObjectProtocol {
    func startDownload()
}

class DownloadView: UIView {
    // MARK: Property

    weak var delegate: DownloadViewDelegate?
    var sessionManager: SessionManager?
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

    deinit {
        NotificationCenter.default.removeObserver(self)
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
        table.register(UINib(nibName: "\(DownloadTaskCell.self)", bundle: nil), forCellReuseIdentifier: DownloadTaskCell.reuseIdentifier)
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

// MARK: - Event

extension DownloadView {
    @objc private func startBtnAction() {
        delegate?.startDownload()
    }

    private func addListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(noti:)), name: .downloadStatusChanged, object: nil)
    }

    @objc private func handleNotification(noti: NSNotification) {
        tableView.reloadData()
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
        return sessionManager?.tasks.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier)!
//        let data = dataSource[indexPath.row]
//        var content = cell.defaultContentConfiguration()
//        // Configure content.
//        content.image = UIImage(systemName: "square.and.arrow.down")
//        content.text = data.name
//        content.secondaryText = data.videoUrl
//        // Customize appearance.
//        content.imageProperties.tintColor = .random
//        cell.contentConfiguration = content
//        return cell

        let cell = tableView.dequeueReusableCell(withIdentifier: DownloadTaskCell.reuseIdentifier, for: indexPath) as! DownloadTaskCell
        return cell
    }

    // 每个 cell 中的状态更新，应该在 willDisplay 中执行
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let task = sessionManager?.tasks.safeObject(at: indexPath.row),
              let cell = cell as? DownloadTaskCell else { return }

        cell.task?.progress { _ in }.success { _ in }.failure { _ in }

        cell.task = task

        cell.titleLabel.text = task.fileName

        cell.updateProgress(task)

        cell.tapClosure = { [weak self] _ in
            guard let task = self?.sessionManager?.tasks.safeObject(at: indexPath.row) else { return }
            switch task.status {
                case .waiting, .running:
                    self?.sessionManager?.suspend(task)
                case .suspended, .failed:
                    self?.sessionManager?.start(task)
                default:
                    break
            }
        }

        task.progress { [weak cell] task in
            cell?.updateProgress(task)
        }
        .success { [weak cell] task in
            cell?.updateProgress(task)
            // 下载任务成功了
        }
        .failure { [weak cell] task in
            cell?.updateProgress(task)
            if task.status == .suspended {
                // 下载任务暂停了
            }

            if task.status == .failed {
                // 下载任务失败了
            }
            if task.status == .canceled {
                // 下载任务取消了
            }
            if task.status == .removed {
                // 下载任务移除了
            }
        }
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
