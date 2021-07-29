//
//  PaymentViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 28/04/21.
//


import UIKit
import Razorpay
class PaymentViewController: BaseViewController,RazorpayPaymentCompletionProtocol {

    //constraint outlets
    @IBOutlet weak var paymentViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var profileImageTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tabbarHeightConstraint: NSLayoutConstraint!
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
    
    var razorpay: RazorpayCheckout!
    var amount:String = memberFeeArray[0]
    var feePeriod = "Annual"
    var amount1:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        razorpay = RazorpayCheckout.initWithKey("rzp_test_9OlcgWpCA9waKM", andDelegate: self)
        sideMenu()
        setupUI()
        profileImage.makeRounded()
        constraintSettings()
        conv()
    }
    
    
    internal func showPaymentForm(){
        let options: [String:Any] = [
            "amount": amount, //This is in currency subunits. 100 = 100 paise= INR 1.
                    "currency": "INR",//We support more that 92 international currencies.
                    "description": feePeriod,
                    "image": "",
                    "name": "Membership Fee",
                    "prefill": [
                        "contact": "\(phone!)",//"8891499358",
                        "email": "\(email!)"//"nikil.deltasoft@gmail.com"
                    ],
                    "theme": [
                        "color": "#F37254"
                      ]
                ]
    
        DispatchQueue.main.async {
            self.razorpay.open(options,displayController: self)
          }
     
    }
    func conv() {
        if let myNumber = NumberFormatter().number(from: amount) {
            amount1 = Int(myNumber) / 100
            lblFee.text = "\(amount1!)"
//            var myInt = myNumber.intValue
            // do what you need to do with myInt
          } else {
            // what ever error code you need to write
          }
    }
    func setupUI() {
        view.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"1B88F1")
        separationView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"E9E9E9")
        paymentView.backgroundColor = UIColor.white
        paymentView.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
        paymentButtonView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"1B8AF4")
        paymentButtonView.layer.cornerRadius = paymentButtonView.bounds.height/2;
        paymentButtonView.clipsToBounds  =  true
        
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.cornerRadius = segmentedControl.bounds.height / 2
        segmentedControl.layer.masksToBounds = true
        segmentedControl.apportionsSegmentWidthsByContent = true
        
        TabbarView.addShadow(location: .top)
    }

    @IBAction func segmentAction(_ sender: Any) {
        if (segmentedControl.selectedSegmentIndex == 0)
        {
            amount = memberFeeArray[0]
            conv()
            lblFee.text = "\(amount1!)"
            feePeriod = "Annual"
        } else
        {
            amount = memberFeeArray[1]
            conv()
            lblFee.text = "\(amount1!)"
            feePeriod = "Lifetime"
        }

    }
    
    @IBAction func returnPolicyTap(_ sender: Any) {
        let destinationController = ReturnPolicyViewController.instantiateViewControllerFromStoryboard(storyBoardName: "PaymentScreens")
        self.navigationController?.pushViewController(destinationController!, animated: true)
    }
 
    @IBAction func paymentTap(_ sender: Any) {
//        showAlertView(heading: "Amount", message: "Amount to be paid is \(lblFee.text!)")
//        let destinationController = PaymentDetailsViewController.instantiateViewControllerFromStoryboard(storyBoardName: "PaymentScreens")
//        self.navigationController?.pushViewController(destinationController!, animated: true)
        
        showPaymentForm()
        
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
            payNowViewTopConstraint.constant = 0
            tabbarHeightConstraint.constant = 60
        }
        else{
            paymentViewTopConstraint.constant = 200
            profileImageTopConstraint.constant = 140
            payNowViewTopConstraint.constant = 0
            tabbarHeightConstraint.constant = 80
        }
    }
    
    func onPaymentError(_ code: Int32, description str: String) {
           print("error: ", code, str)
//           self.presentAlert(withTitle: "Alert", message: str)
       }

       func onPaymentSuccess(_ payment_id: String) {
           print("success: ", payment_id)
//           self.presentAlert(withTitle: "Success", message: "Payment Succeeded")
       }
}

//import UIKit
//
//class PaymentViewController: BaseViewController {
//
//    //constraint outlets
//    @IBOutlet weak var paymentViewTopConstraint: NSLayoutConstraint!
//    @IBOutlet weak var profileImageTopConstraint: NSLayoutConstraint!
//
//    @IBOutlet weak var tabbarHeightConstraint: NSLayoutConstraint!
//    @IBOutlet weak var payNowViewTopConstraint: NSLayoutConstraint!
//    //Object outlets
//    @IBOutlet weak var paymentView: UIView!
//
//    @IBOutlet weak var profileImage: UIImageView!
//    //outlets for attributes for payment
//    @IBOutlet weak var attributesView: UIView!
//    @IBOutlet weak var lblStatusTitle: UILabel!
//    @IBOutlet weak var segmentedControl: UISegmentedControl!
//    @IBOutlet weak var lblStatus: UILabel!
//
//    @IBOutlet weak var lblTermInfo: UILabel!
//    @IBOutlet weak var lblFee: UILabel!
//    @IBOutlet weak var paymentButtonView: UIView!
//    @IBOutlet weak var separationView: UIView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        sideMenu()
//        setupUI()
//        profileImage.makeRounded()
//        constraintSettings()
//    }
//
//
//    func setupUI() {
//        view.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"1B88F1")
//        separationView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"E9E9E9")
//        paymentView.backgroundColor = UIColor.white
//        paymentView.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
//        paymentButtonView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"1B8AF4")
//        paymentButtonView.layer.cornerRadius = paymentButtonView.bounds.height/2;
//        paymentButtonView.clipsToBounds  =  true
//
//        segmentedControl.layer.borderWidth = 1
//        segmentedControl.layer.cornerRadius = segmentedControl.bounds.height / 2
//        segmentedControl.layer.masksToBounds = true
//        segmentedControl.apportionsSegmentWidthsByContent = true
//
//        TabbarView.addShadow(location: .top)
//    }
//
//    @IBAction func segmentAction(_ sender: Any) {
//        if (segmentedControl.selectedSegmentIndex == 0)
//        {
//            lblFee.text = "400"
//        } else
//        {
//
//            lblFee.text = "4000"
//        }
//
//    }
//
//    @IBAction func returnPolicyTap(_ sender: Any) {
//        let destinationController = ReturnPolicyViewController.instantiateViewControllerFromStoryboard(storyBoardName: "PaymentScreens")
//        self.navigationController?.pushViewController(destinationController!, animated: true)
//    }
//
//    @IBAction func paymentTap(_ sender: Any) {
////        showAlertView(heading: "Amount", message: "Amount to be paid is \(lblFee.text!)")
//        let destinationController = PaymentDetailsViewController.instantiateViewControllerFromStoryboard(storyBoardName: "PaymentScreens")
//        self.navigationController?.pushViewController(destinationController!, animated: true)
//
//    }
//
//}
//
////MARK:- autolayout setups
//extension PaymentViewController
//{
//    func constraintSettings() {
//        if UIScreen.main.bounds.height < 850
//        {
//            paymentViewTopConstraint.constant = 100
//            profileImageTopConstraint.constant = 40
//            payNowViewTopConstraint.constant = 0
//            tabbarHeightConstraint.constant = 60
//        }
//        else{
//            paymentViewTopConstraint.constant = 200
//            profileImageTopConstraint.constant = 140
//            payNowViewTopConstraint.constant = 0
//            tabbarHeightConstraint.constant = 80
//        }
//    }
//}
