//
//  HomeScreenViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 07/06/21.
//

import UIKit

class HomeScreenViewController: BaseViewController {

    @IBOutlet weak var sideMenuImage: UIImageView!
    
    @IBOutlet weak var homeTableView: UITableView!
    
    @IBOutlet weak var logoImg: UIImageView!
    var homeScreenDataSource: HomeScreenDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientTwoColors()
        logoImg.makeRounded()
        

        // Do any additional setup after loading the view.
        self.homeScreenDataSource = HomeScreenDataSource(attachView: self)
    }
    

}
