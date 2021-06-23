//
//  VideosViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 23/06/21.
//

import UIKit

class VideosViewController: BaseViewController {

    @IBOutlet weak var videosTableView: UITableView!
    
    var videosTableDataSource: VideosTableDataSource?
    
    var videoTitle = ["Big Bunny"]
    var videoSubTitle = ["Subtitle asdfg asddd"]
    var videoUrl = ["http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"]
    
    override func viewDidLoad() {
        
        self.videosTableDataSource = VideosTableDataSource(attachView: self)
        super.viewDidLoad()
        
        setupUI()

        // Do any additional setup after loading the view.
    }
    

  func setupUI()
  {
    gradientColors()
    sideMenu()
    
    //Create Nib
    let nib = UINib(nibName: "VideosTableViewCell", bundle: nil)
    videosTableView.register(nib, forCellReuseIdentifier: "videoCell")
  }

}
