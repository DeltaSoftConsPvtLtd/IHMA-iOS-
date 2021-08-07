//
//  GuestRegistrationViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 06/08/21.
//

import UIKit

class GuestRegistrationViewController: BaseViewController {

    @IBOutlet weak var formView: UIView!
    var guestregistrationTableDataSource: GuestRegistrationTableDataSource?
    
    @IBOutlet weak var guestFormTableView: UITableView!
    var titleNames = ["Name","Email","Mobile","Reg number","State"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
        self.guestregistrationTableDataSource = GuestRegistrationTableDataSource(attachView: self)
    }
    
    func setupUI() {
        view.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"1B88F1")
        formView.backgroundColor = UIColor.white
        formView.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 30.0)
    }

}
