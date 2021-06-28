//
//  ContactUsViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 15/06/21.
//

import UIKit

class ContactUsViewController: BaseViewController {
   
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewAddress: UIView!
    @IBOutlet weak var lblAddressTitle: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var imgLocation: UIImageView!
    @IBOutlet weak var viewContact: UIView!
    @IBOutlet weak var lblContactInfoTitle: UILabel!
    @IBOutlet weak var lblContactInfo: UILabel!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var imgPhone: UIImageView!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var imgEmail: UIImageView!
    @IBOutlet weak var lblEmail: UILabel!
    
    //MARK:- Constraints
    @IBOutlet weak var addressViewTopConstraint: NSLayoutConstraint!
    //variables
    var image:String?
    var name:String?
    var contactTitle:String?
    var positionName:String?
    var address:String?
    var phone:String?
    var email:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientColors()
        sideMenu()
        updateUI()
        constraintSettings()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        imgProfile.makeRounded()
        imgProfile.image = UIImage(named: image!)
        lblContactInfoTitle.text = contactTitle
        lblTitle.text = name
        lblContactInfo.text = positionName
        lblAddress.text = address
        lblPhone.text = phone
        lblEmail.text = email
    }
    func constraintSettings() {
        if UIScreen.main.bounds.height < 850
        {
            addressViewTopConstraint.constant = -50
        }
        else{
            addressViewTopConstraint.constant = -100
        }
    }

}
