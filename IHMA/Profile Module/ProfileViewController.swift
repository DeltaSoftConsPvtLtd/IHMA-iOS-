//
//  ProfileViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 30/04/21.
//

import UIKit

class ProfileViewController: BaseViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAboutPayment: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var lblFee: UILabel!
   
    
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var lblAddress1: UILabel!
    @IBOutlet weak var lblAddress2: UILabel!
    @IBOutlet weak var contactDetailsView: UIView!
    @IBOutlet weak var lblPhoneno: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var buttonView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        sideMenu()

        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        profileView.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
        profileImage.makeRounded()
        
        buttonView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"1B8AF4")
        buttonView.layer.cornerRadius = buttonView.bounds.height/2;
        buttonView.clipsToBounds  =  true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnAction(_ sender: Any) {
    }
    
}
