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
    
    var activity:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientColors()
        sideMenu()
        updateUI()
        // Do any additional setup after loading the view.
        self.activityDatasource = ActivityDatasource(attachView: self)
    }
    

    func updateUI() {
        lblTitle.text = activity
    }
}
