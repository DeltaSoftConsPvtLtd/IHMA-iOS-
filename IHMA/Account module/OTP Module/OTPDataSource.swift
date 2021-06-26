//
//  OTPDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 06/05/21.
//

import UIKit

class OTPDataSource: NSObject {
    weak var parentView: OTPViewController?
    var otp:String?
    var newPassword:String?
    init(attachView: OTPViewController) {
        super.init()
        self.parentView = attachView
        attachView.txtOTP1.delegate = self
        attachView.txtOTP2.delegate = self
        attachView.txtOTP3.delegate = self
        attachView.txtOTP4.delegate = self
        attachView.txtOTP5.delegate = self
        attachView.txtOTP6.delegate = self

        parentView!.verifyButton.addTarget(self,action:#selector(verifyBtnTapped(sender:)), for: .touchUpInside)
    }
    
    func confirmOTPApi(_ email: String,_ token: String,_ otp: String) {
        //MARK:- Activity Indicator
        parentView!.activityIndicator.startAnimating()
        parentView!.activityIndicator.isHidden = false
        parentView!.otpView.isUserInteractionEnabled = false
        let url = "\(testUrl)\(confirmOTP)"
        let post = Post_OTPModel(email: email,token:token,otp:otp)
        ApiClient.shared.getData("POST", url, post, ConfirmotpModel.self){ [self](sucess, resp, msg) in
            if sucess {
                let response = resp as! ConfirmotpModel
                newPassword = (response.data![0].details?.newPassword)!
                if let authentication = response.data![0].status {
                    if (authentication == "Authenticated") {
                        parentView!.activityIndicator.stopAnimating()
                        parentView!.activityIndicator.isHidden = true
                        parentView!.otpView.isUserInteractionEnabled = true
                        alert()
                        
                    } else {
                        parentView!.activityIndicator.stopAnimating()
                        parentView!.activityIndicator.isHidden = true
                        parentView!.otpView.isUserInteractionEnabled = true
                        parentView!.toastMessage(message: "Please enter the correct OTP!")
                    }
                }//if let
             }//success
            }//Api
    }
    
//    MARK:- Alert message
    func alert() {
        let alert = UIAlertController(title: "New Password", message: "New Password is '\(newPassword!)'. Please use it for login", preferredStyle: UIAlertController.Style.alert)
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { [self]
                UIAlertAction in
            //Action for exiting the app
            let destinationController = LoginViewController.instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
            parentView!.navigationController?.pushViewController(destinationController!, animated: true)
            }
        // Add the actions
            alert.addAction(okAction)
        parentView!.present(alert, animated: true, completion: nil)
    }
    
   
    @objc func verifyBtnTapped(sender: UIButton)  {
      print (otp!)
        if (otp != "")
        {
            confirmOTPApi((parentView?.email)!, (parentView?.token)!, self.otp!)
        } else {
            parentView?.showAlertView(heading: "OTP", message: "Plz enter the OTP")
        }
        
////    let myInt = (otp as! NSString).integerValue
//        if (otp == "1234")
//        {
//            let destinationController = ResetPasswordViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
//            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
////            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
////            let tabbar: UITabBarController? = (storyBoard.instantiateViewController(withIdentifier: "MainTabPage") as? UITabBarController)
////            //MARK:- to change the color of tabbar
////            tabbar?.tabBar.barTintColor = UIColor.white
////            parentView!.navigationController?.pushViewController(tabbar!, animated: true)
//        }
//        else {
//            parentView!.toastMessage(message: "Please enter correct otp!")
//            
//            //MARK:- clear all fields
//            parentView?.txtOTP1.text = ""
//            parentView?.txtOTP2.text = ""
//            parentView?.txtOTP3.text = ""
//            parentView?.txtOTP4.text = ""
//            parentView?.txtOTP1.becomeFirstResponder()
//        }
    }
}

//MARK:- Delegate methods
extension OTPDataSource:UITextFieldDelegate {
    
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1) && (string.count > 0 ) {
            if textField == parentView?.txtOTP1 {
                parentView?.txtOTP2.becomeFirstResponder()
                otp = string
            }
            
            if textField == parentView?.txtOTP2 {
                parentView?.txtOTP3.becomeFirstResponder()
                otp = otp! + string
            }
            
            if textField == parentView?.txtOTP3 {
                parentView?.txtOTP4.becomeFirstResponder()
                otp = otp! + string
            }
            
            if textField == parentView?.txtOTP4 {
                parentView?.txtOTP5.becomeFirstResponder()
                otp = otp! + string
            }
            
            if textField == parentView?.txtOTP5 {
                parentView?.txtOTP6.becomeFirstResponder()
                otp = otp! + string
            }
            
            if textField == parentView?.txtOTP6 {
                parentView?.txtOTP6.resignFirstResponder()
                otp = otp! + string
            }
            
            textField.text = string
            return false
            
        } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            if textField == parentView?.txtOTP2 {
                parentView?.txtOTP1.becomeFirstResponder()
            }
            
            if textField == parentView?.txtOTP3 {
                parentView?.txtOTP2.becomeFirstResponder()
            }
            
            if textField == parentView?.txtOTP4 {
                parentView?.txtOTP3.becomeFirstResponder()
            }
            
            if textField == parentView?.txtOTP5 {
                parentView?.txtOTP4.becomeFirstResponder()
            }
            
            if textField == parentView?.txtOTP6 {
                parentView?.txtOTP5.becomeFirstResponder()
            }
            
            if textField == parentView?.txtOTP1 {
                parentView?.txtOTP1.resignFirstResponder()
            }
            textField.text = ""
            return false
        } else if (textField.text?.count)! >= 1 {
            textField.text = string
            return false
        }
        return true
    }
}
