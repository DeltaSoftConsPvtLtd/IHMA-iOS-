//
//  ResetPasswordViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 04/06/21.
//

import UIKit

class EmailViewController: BaseViewController {

  
   
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var resetPasswordView: UIView!

    
    @IBOutlet weak var topImage: UIImageView!
   
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var emailView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientTwoColors()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
   
    func updateUI() {
        resetPasswordView.layer.cornerRadius = resetPasswordView.bounds.height/2;
        resetPasswordView.clipsToBounds  =  true
        resetPasswordView.backgroundColor = UIColor.white
        txtEmail.addUnderLine()
        txtEmail.becomeFirstResponder()
        activityIndicator.isHidden = true
        
        topImage.makeRounded()
        
    }
    
    //MARK:- Api call to reset password
    func resetPasswordAPI(_ email: String) {
        //MARK:- Activity Indicator
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        emailView.isUserInteractionEnabled = false
        
        
        let url = "\(testUrl)\(resetPassword)"
        let post = ResetPassword_Model(email: email)
        ApiClient.shared.getData("POST", url, post, otpModel.self) { [self](sucess, resp, msg) in
            if sucess {
                let response = resp as! otpModel
                if let authentication = response.data![0].status {
                    if (authentication == "Authenticated") {
                        //APi call success
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true
                        self.emailView.isUserInteractionEnabled = true
                      print("success")
                        
                        let destinationController = OTPViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens") as? OTPViewController
                        destinationController?.token = String((response.data![0].details?.token)!)
                        destinationController?.email = email
                        self.navigationController?.pushViewController(destinationController!, animated: true)
                        print(response.data![0].details?.token)
                    } else {
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true
                        self.emailView.isUserInteractionEnabled = true
                        self.txtEmail.text = ""
                        self.txtEmail.becomeFirstResponder()
                        self.toastMessage(message: "Please enter the registered mail id")
                    }
                }
                
            }
        }//api call
        }

    
}

//Mark:- Actions
extension EmailViewController {
  
    @IBAction func btnSubmit(_ sender: Any) {
        if (isValidEmail(testStr: txtEmail.text!)) {
        resetPasswordAPI(txtEmail.text!)
        } else {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.emailView.isUserInteractionEnabled = true
            txtEmail.text = ""
            txtEmail.becomeFirstResponder()
            showAlertView(heading: "Invalid mail id", message: "Please enter correct mail id")
        }
         
    }
}
