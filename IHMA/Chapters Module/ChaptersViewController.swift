//
//  ChaptersViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 17/06/21.
//

import UIKit

class ChaptersViewController: BaseViewController {

    @IBOutlet weak var chapterListTableView: UITableView!
    var chaptersDataSource: ChaptersDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientColors()
        sideMenu()

        // Do any additional setup after loading the view.
        self.chaptersDataSource = ChaptersDataSource(attachView: self)
    }
    

  

}
