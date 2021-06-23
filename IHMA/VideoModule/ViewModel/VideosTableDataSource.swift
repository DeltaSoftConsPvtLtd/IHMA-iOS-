//
//  VideosTableDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 23/06/21.
//

import UIKit
import AVKit

class VideosTableDataSource: NSObject {

    weak var parentView:VideosViewController?
    var playerViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    init(attachView: VideosViewController) {
        super.init()
        self.parentView = attachView
        attachView.videosTableView.delegate = self
        attachView.videosTableView.dataSource = self
    }
    
    //Create Play Video
    func playVideo(videoURL:String) {
        let url: URL = URL(string: videoURL)!
        playerView = AVPlayer(url: url)
        playerViewController.player = playerView
        
        self.parentView?.present(playerViewController, animated: true)
        self.playerViewController.player?.play()
    }
    
    //Click Action to play video
    @objc func playBtnTapped(sender:UIButton) {
        playVideo(videoURL: (self.parentView?.videoUrl[sender.tag])!)
    }
    
}

//////Mark:- Delegate Methods
//extension VideosTableDataSource: UITableViewDelegate {
//    
//}

//Mark:- Datasource methods
extension VideosTableDataSource: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.parentView?.videoTitle.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = self.parentView?.videosTableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as? VideosTableViewCell
        cell?.comminInit(title: (self.parentView?.videoTitle[indexPath.row])!, subTitle: (self.parentView?.videoSubTitle[indexPath.row])!, videoUrl: (self.parentView?.videoUrl[indexPath.row])!)
        cell!.clickBtn.tag = indexPath.row
        cell!.clickBtn.addTarget(self, action: #selector(playBtnTapped(sender:)),
                                    for: UIControl.Event.touchUpInside)
        return cell!


    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
