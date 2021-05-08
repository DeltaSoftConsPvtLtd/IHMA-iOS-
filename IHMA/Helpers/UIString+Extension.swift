//
//  UIString+Extension.swift
//  IHMA
//
//  Created by Nikil Davis on 07/05/21.
//

import UIKit

extension String {
    //MARK:- validation for username
    func isValidInput(Input:String) -> Bool {
        let RegEx = "\\w{7,18}"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Input)
    }
    
    //MARK:- validation of email
    func isValidEmail(testStr:String) -> Bool {
        
        print("validate emilId: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
        
    }
    
    //MARK:- validation of phone number
    func validate(value: String) -> Bool {
                let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
                let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
                let result = phoneTest.evaluate(with: value)
                return result
            }
    
    //MARK:- validation for password
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
