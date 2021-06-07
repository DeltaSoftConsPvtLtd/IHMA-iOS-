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
    var homeScreenDataSource: HomeScreenDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientTwoColors()
        

        // Do any additional setup after loading the view.
        self.homeScreenDataSource = HomeScreenDataSource(attachView: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
