//
//  ActivitiesViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 15/06/21.
//

import UIKit

class ActivitiesViewController: BaseViewController {
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var activityTableView: UITableView!
    var activityDatasource: ActivityDatasource?
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientColors()
        sideMenu()
        // Do any additional setup after loading the view.
        self.activityDatasource = ActivityDatasource(attachView: self)
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
