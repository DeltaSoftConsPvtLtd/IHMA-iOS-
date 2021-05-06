//
//  Authentication.swift
//  IHMA
//
//  Created by Nikil Davis on 26/04/21.
//

import Foundation

class Authentication: NSObject {
    var user: User1!
    var username: String {return user.userName}
    var email: String {return user.email}
    
    typealias  authenticationLoginCallBack = (_ status:Bool, _ message:String) -> Void
    var loginCallback:authenticationLoginCallBack?
    func authenticateUserWith(_ username:String, andPassword password:String) {
        if username.count != 0 {
            if password.count != 0 {
                verifyUserWith(username, andPassword: password)
            } else {
                //Password empty
                self.loginCallback?(false, "Password should not be empty")
            }
        } else {
            //username empty
            self.loginCallback?(false, "Username should not be empty")
        }
    }//func
    
    //MARK:- verifyUserWith
    fileprivate func verifyUserWith(_ username:String, andPassword password:String) {
        
        if username == "test@testmail.com" && password == "nikivava12#" {
            user = User1(userName: username, email: "\(username)@testmail.com")
            self.loginCallback?(true, "User is successfully authenticated")
        } else {
            // invalid credentials
            self.loginCallback?(false, "Please enter valid credentials")
        }
    }//func
    
    func loginCompletionHandler(callBack: @escaping authenticationLoginCallBack) {
        self.loginCallback = callBack
    }
}//class
