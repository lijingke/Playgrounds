//
//  VideoPlayerVC.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/15.
//

import Foundation
import Player

let videoUrl = URL(string: "https://www.w3schools.com/html/movie.mp4")!

class VideoPlayerVC: BaseViewController {
    // MARK: Property
    var filePath: String?
    
    // MARK: object lifecycle

    deinit {
        self.player.willMove(toParent: nil)
        self.player.view.removeFromSuperview()
        self.player.removeFromParent()
    }

    // MARK: view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addChild(self.player)
        self.view.addSubview(self.player.view)
        self.player.didMove(toParent: self)

//        let localUrl = Bundle.main.url(forResource: "IMG_3267", withExtension: "MOV")
//        self.player.url = localUrl
        self.player.url = URL(filePath: filePath ?? "")
       
        self.player.playbackLoops = true

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.player.view.addGestureRecognizer(tapGestureRecognizer)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.player.playFromBeginning()
    }

    // MARK: Lazy Get

    lazy var player: Player = {
        let player = Player()
        player.playerDelegate = self
        player.playbackDelegate = self
        player.playerView.playerBackgroundColor = .white
        return player
    }()
}

// MARK: - UIGestureRecognizer

extension VideoPlayerVC {
    @objc func handleTapGestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer) {
        switch self.player.playbackState {
        case .stopped:
            self.player.playFromBeginning()
        case .paused:
            self.player.playFromCurrentTime()
        case .playing:
            self.player.pause()
        case .failed:
            self.player.pause()
        }
    }
}

// MARK: - PlayerDelegate

extension VideoPlayerVC: PlayerDelegate {
    func playerReady(_ player: Player) {
        print("\(#function) ready")
    }

    func playerPlaybackStateDidChange(_ player: Player) {
        print("\(#function) \(player.playbackState.description)")
    }

    func playerBufferingStateDidChange(_ player: Player) {}

    func playerBufferTimeDidChange(_ bufferTime: Double) {}

    func player(_ player: Player, didFailWithError error: Error?) {
        print("\(#function) error.description")
    }
}

// MARK: - PlayerPlaybackDelegate

extension VideoPlayerVC: PlayerPlaybackDelegate {
    func playerCurrentTimeDidChange(_ player: Player) {}

    func playerPlaybackWillStartFromBeginning(_ player: Player) {}

    func playerPlaybackDidEnd(_ player: Player) {}

    func playerPlaybackWillLoop(_ player: Player) {}

    func playerPlaybackDidLoop(_ player: Player) {}
}
