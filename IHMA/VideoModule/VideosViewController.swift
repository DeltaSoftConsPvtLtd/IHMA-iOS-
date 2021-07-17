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
    
    var photos = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","22","23","24","25","26","27","28","29","30"]
    
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
    
    let nib2 = UINib(nibName: "PhotosTableViewCell", bundle: nil)
    videosTableView.register(nib2, forCellReuseIdentifier: "photosCell")
  }

}
