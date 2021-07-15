//
//  ProfileViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 30/04/21.
//

import UIKit

class ProfileViewController: BaseViewController {
//MARK:- Constraints
    @IBOutlet weak var profileViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var contactDetailsViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var lblprofileName: UILabel!
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
    
    @IBOutlet weak var tabbarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        sideMenu()
        constraintSettings()
        print(profileName)

        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        profileView.backgroundColor = UIColor.white
        profileView.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
        profileImage.makeRounded()
        
        buttonView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"1B8AF4")
        buttonView.layer.cornerRadius = buttonView.bounds.height/2;
        buttonView.clipsToBounds  =  true
        addressView.backgroundColor = UIColor.white
        contactDetailsView.backgroundColor = UIColor.white
//        TabbarView.addShadow(location: .top)
        lblprofileName.text = profileName!
        lblEmail.text = email!
        lblPhoneno.text = phone!
        lblAboutPayment.text = joiningDate!
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

//MARK:- autolayout setups
extension ProfileViewController
{
    func constraintSettings() {
        if UIScreen.main.bounds.height < 850
        {
            profileViewTopConstraint.constant = 100
            buttonViewTopConstraint.constant = 25.0
            contactDetailsViewTopConstraint.constant = 20
//            tabbarHeightConstraint.constant = 60.0
        }
        else{
            profileViewTopConstraint.constant = 150
            buttonViewTopConstraint.constant = 50.0
            contactDetailsViewTopConstraint.constant = 50
//            tabbarHeightConstraint.constant = 80.0
        }
    }
}
