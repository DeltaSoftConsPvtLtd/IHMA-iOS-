//
//  NotificationViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 30/04/21.
//

import UIKit

class NotificationViewController: BaseViewController {

    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var notificationTableView: UITableView!
    var notificationDataSource : NotificationDataSource?
    let descriptions = ["Membership is Approved", "A new course is started"]
    let status = ["Pay Now", "Join Now"]
    let date = ["25", "24"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        self.notificationDataSource = NotificationDataSource(attachView: self)
        // Do any additional setup after loading the view.
    }
    

    func setupUI() {
        backgroundView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"176AB5")
        notificationView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"CC2B2B")
        notificationView.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
        notificationTableView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"CC2B2B")
    }

}
