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
        
        sessionManager = SessionManager(DownloadViewController.identifier, configuration: SessionConfiguration())
        sessionManager.logger.option = .default
        NotificationCenter.default.post(name: .receiveData, object: sessionManager)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let sportModel = configData() {
            videosSource = sportModel.data?.exerciseDetail?.videoMetas?.videos ?? []
            mainView.refreshData(videosSource)
        }
    }
    
    // MARK: Lazy Get

    lazy var mainView: DownloadView = {
        let view = DownloadView()
        return view
    }()
}

// MARK: - Data
extension DownloadViewController {
    private func configData() -> SportModel? {
        guard let path = Bundle.main.path(forResource: "sport", ofType: "json") else { return nil }
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
