//
//  PaymentViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 28/04/21.
//

import UIKit

class PaymentViewController: BaseViewController {

    //constraint outlets
    @IBOutlet weak var paymentViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var profileImageTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var payNowViewTopConstraint: NSLayoutConstraint!
    //Object outlets
    @IBOutlet weak var paymentView: UIView!
    
    @IBOutlet weak var profileImage: UIImageView!
    //outlets for attributes for payment
    @IBOutlet weak var attributesView: UIView!
    @IBOutlet weak var lblStatusTitle: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var lblStatus: UILabel!
    
    @IBOutlet weak var lblTermInfo: UILabel!
    @IBOutlet weak var lblFee: UILabel!
    @IBOutlet weak var paymentButtonView: UIView!
    @IBOutlet weak var separationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu()
        setupUI()
        profileImage.makeRounded()
        constraintSettings()
    }
    
    func setupUI() {
        view.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"1B88F1")
        separationView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"E9E9E9")
        paymentView.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
        paymentButtonView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"1B8AF4")
        paymentButtonView.layer.cornerRadius = paymentButtonView.bounds.height/2;
        paymentButtonView.clipsToBounds  =  true
        
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.cornerRadius = segmentedControl.bounds.height / 2
        segmentedControl.layer.masksToBounds = true
        segmentedControl.apportionsSegmentWidthsByContent = true
    }

    @IBAction func segmentAction(_ sender: Any) {
        if (segmentedControl.selectedSegmentIndex == 0)
        {
            lblFee.text = "1000"
        } else
        {
            
            lblFee.text = "4000"
        }

    }
 

}

//MARK:- autolayout setups
extension PaymentViewController
{
    func constraintSettings() {
        if UIScreen.main.bounds.height < 850
        {
            paymentViewTopConstraint.constant = 100
            profileImageTopConstraint.constant = 40
            payNowViewTopConstraint.constant = 20
        }
        else{
            paymentViewTopConstraint.constant = 200
            profileImageTopConstraint.constant = 140
            payNowViewTopConstraint.constant = 50
        }
    }
}
