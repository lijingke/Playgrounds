//
//  VideoPlayerVC.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/15.
//

import Foundation
import Player
import CLPlayer

let videoUrl = URL(string: "https://www.w3schools.com/html/movie.mp4")!

class VideoPlayerVC: BaseViewController {
    // MARK: Property
    var filePath: String?

    // MARK: view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // MARK: Lazy Get
    lazy var fullScreenBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("全屏播放", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(hexString: "#B0E0E6")
        btn.titleLabel?.font = UIFont.medium(16)
        btn.layer.cornerRadius = 22
        btn.addTarget(self, action: #selector(clickFullScreenButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func clickFullScreenButton() {
        
    }
    
    private lazy var placeholderView: CLPlaceholderView = {
        let view = CLPlaceholderView()
        view.addTarget(self, action: #selector(playAction), for: .touchUpInside)
        return view
    }()

    private lazy var player: CLPlayer = {
        let view = CLPlayer(frame:.zero) { config in
            config.videoGravity = .resizeAspectFill
            config.topBarHiddenStyle = .never
            config.isHiddenToolbarWhenStart = false
        }
        view.placeholder = placeholderView
        return view
    }()
    
    @objc func playAction() {
        placeholderView.imageView.image = UIImage(named: "placeholder")
//        player.url = URL(string: "https://www.apple.com/105/media/cn/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/bruce/mac-bruce-tpl-cn-2018_1280x720h.mp4")
        player.url = URL(filePath: filePath ?? "")
        player.play()
    }
}

// MARK: - UI

extension VideoPlayerVC {
    private func setupUI() {
        view.backgroundColor = .white
        self.view.addSubviews([player, fullScreenBtn])
        player.snp.makeConstraints { make in
            make.top.equalTo(wx_navigationBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.bounds.width / (16.0 / 9.0))
        }
        fullScreenBtn.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalToSuperview().offset(38)
            make.right.equalToSuperview().offset(-38)
            make.height.equalTo(44)
        }
    }
}
