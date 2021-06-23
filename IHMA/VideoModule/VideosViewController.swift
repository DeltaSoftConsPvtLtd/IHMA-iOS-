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
    
    var videoTitle = ["Big Buck Bunny","Elephant Dream"]
    var videoSubTitle = ["Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself.","The first blender movie from 2006"]
    var videoUrl = ["http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4","http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"]
    
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
