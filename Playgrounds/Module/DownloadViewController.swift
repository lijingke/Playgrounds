//
//  DownloadViewController.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/13.
//

import Foundation
import UIKit
import Tiercel

class DownloadViewController: UIViewController {
    // MARK: Property
    var videosSource: [SportDataExerciseDetailVideoMetasVideos] = []
    var sessionManager: SessionManager!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
//        self.navigationController?.navigationBar.isTranslucent = false
        setupUI()
        // 检查磁盘空间
        let free = FileManager.default.tr.freeDiskSpaceInBytes / 1024 / 1024
        print("手机剩余储存空间为： \(free)MB")
        
        if let sportModel = configData() {
            videosSource = sportModel.data?.exerciseDetail?.videoMetas?.videos ?? []
        }
        setupManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: Lazy Get

    lazy var mainView: DownloadView = {
        let view = DownloadView()
        view.delegate = self
        return view
    }()
}

// MARK: - DownloadViewDelegate
extension DownloadViewController: DownloadViewDelegate {
    
    func startDownload() {
        sessionManager.totalStart()
    }
    
}

// MARK: - Tiercel
extension DownloadViewController {
    func setupManager() {
        
        sessionManager = appDelegate.sessionManager
        NotificationCenter.default.post(name: .downloadStatusChanged, object: sessionManager)

        let downloadURLStrings = videosSource.compactMap({URL(string: $0.videoUrl ?? "")})
        let fileInfoTuples = videosSource.compactMap({($0.name ?? "UnknowName", $0.videoUrl?.components(separatedBy:".").last ?? "UnknowType")})
        let fileNamesStrings = fileInfoTuples.compactMap({"\($0.0).\($0.1)"})
        DispatchQueue.global().async {
            self.sessionManager.multiDownload(downloadURLStrings, fileNames: fileNamesStrings) { [weak self] _ in
                self?.sessionManager.totalSuspend()
                NotificationCenter.default.post(name: .downloadStatusChanged, object: nil)
            }
        }
        
        // 设置 manager 的回调
        sessionManager.progress { [weak self] (manager) in
            NotificationCenter.default.post(name: .downloadStatusChanged, object: self?.sessionManager)
            LogUtil.log("\(manager.progress.fractionCompleted)")
        }.completion { [weak self] manager in
            NotificationCenter.default.post(name: .downloadStatusChanged, object: self?.sessionManager)
            if manager.status == .succeeded {
                // 下载成功
                LogUtil.log("DownloadSuccess")
            } else {
                // 其他状态
            }
        }
    }
}

// MARK: - Data
extension DownloadViewController {
    private func configData() -> SportModel? {
        guard let path = Bundle.main.path(forResource: "Sport", ofType: "json") else { return nil }
        let localData = NSData(contentsOfFile: path)! as Data
        let model = SportModel.deserialize(from: localData.toDic())
        return model
    }
}

// MARK: - UI
extension DownloadViewController {
    private func setupUI() {
        title = "Downloads"
        view.backgroundColor = .white
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
