//
//  OTPDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 06/05/21.
//

import UIKit

class OTPDataSource: NSObject {
    weak var parentView: OTPViewController?
    
    init(attachView: OTPViewController) {
        super.init()
        self.parentView = attachView
        attachView.txtOTP1.delegate = self
        attachView.txtOTP2.delegate = self
        attachView.txtOTP3.delegate = self
        attachView.txtOTP4.delegate = self
    }
}

//MARK:- Delegate methods
extension OTPDataSource:UITextFieldDelegate {
    
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1) && (string.count > 0 ) {
            if textField == parentView?.txtOTP1 {
                parentView?.txtOTP2.becomeFirstResponder()
            }
            
            if textField == parentView?.txtOTP2 {
                parentView?.txtOTP3.becomeFirstResponder()
            }
            
            if textField == parentView?.txtOTP3 {
                parentView?.txtOTP4.becomeFirstResponder()
            }
            
            if textField == parentView?.txtOTP4 {
                parentView?.txtOTP4.resignFirstResponder()
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
