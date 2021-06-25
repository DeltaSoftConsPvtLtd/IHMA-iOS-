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
        let url = "\(testUrl)\(confirmOTP)"
        let post = Post_OTPModel(email: email,token:token,otp:otp)
        ApiClient.shared.getData("POST", url, post, ConfirmotpModel.self){(sucess, resp, msg) in
            if sucess {
                let response = resp as! ConfirmotpModel
                let newPassword = response.data![0].details?.newPassword
                if let authentication = response.data![0].status {
                    if (authentication == "Authenticated") {
                        
                    } else {
                        
                    }
                }//if let
             }//success
            }//Api
    }
    
   
    @objc func verifyBtnTapped(sender: UIButton)  {
      print (otp!)
        if (otp != "")
        {
            confirmOTPApi((parentView?.token)!, (parentView?.token)!, self.otp!)
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
                parentView?.txtOTP5.resignFirstResponder()
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
