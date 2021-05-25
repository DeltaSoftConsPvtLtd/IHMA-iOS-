//
//  Authentication.swift
//  IHMA
//
//  Created by Nikil Davis on 26/04/21.
//

import Foundation
import UIKit

var profileName:String?

class Authentication: NSObject {
    weak var parentView: LoginViewController?
    init(attachView: LoginViewController) {
        super.init()
        self.parentView = attachView
        
    }

    func authenticateUserWith(_ username:String, andPassword password:String) {
        if username.count != 0 {
            if password.count != 0 {
                loginAPI(username, password)
            } else {
                //Password empty
                self.parentView?.activityIndicator.stopAnimating()
                self.parentView?.activityIndicator.isHidden = true
                self.parentView?.loginView.isUserInteractionEnabled = true
                
                self.parentView?.toastMessage(message: "Password field empty")
                self.parentView?.txtPassword.becomeFirstResponder()
            }
        } else {
            //username empty
            self.parentView?.activityIndicator.stopAnimating()
            self.parentView?.activityIndicator.isHidden = true
            self.parentView?.loginView.isUserInteractionEnabled = true
            
            self.parentView?.toastMessage(message: "Username field empty")
            self.parentView?.txtUsername.becomeFirstResponder()
        }
    }//func
    
    func loginAPI(_ user: String, _ psw :String) {


        let url = "\(baseUrl)\(userSignIn)"
        let post = Post_Model(username: user, password: psw)
        ApiClient.shared.getData("POST",url, post, LoginModel.self) { (sucess, resp, msg) in
                    if sucess{
                        print(resp)
                        let response = resp as! LoginModel
//                        print(response.data![0].session_token!)
                    if let authentication = response.data![0].status {
                        if (authentication == "Authenticated") {
                            //MARK:- activity indicator actions
                            self.parentView?.activityIndicator.stopAnimating()
                            self.parentView?.activityIndicator.isHidden = true
                            self.parentView?.loginView.isUserInteractionEnabled = true
                            
                        
                                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                                let tabbar: UITabBarController? = (storyBoard.instantiateViewController(withIdentifier: "MainTabPage") as? UITabBarController)
                                //MARK:- to change the color of tabbar
                                tabbar?.tabBar.barTintColor = UIColor.white
                                self.parentView?.navigationController?.pushViewController(tabbar!, animated: true)
                
                            //MARK:- set profile name
                            profileName = response.data![0].user?.username!
                            
                            //MARK:- save session token in userdefaults
                            UserDefaults.standard.set(response.data![0].session_token!, forKey: "sessionToken") //setObject
                        } else {
                            //MARK:- activity indicator actions
                            self.parentView?.activityIndicator.stopAnimating()
                            self.parentView?.activityIndicator.isHidden = true
                            self.parentView?.loginView.isUserInteractionEnabled = true
                            
                            self.parentView?.toastMessage(message: "invalid credentials")
                            self.parentView?.txtUsername.text = ""
                            self.parentView?.txtPassword.text = ""
                            self.parentView?.txtUsername.becomeFirstResponder()
                        }//end of if condition
                    } else { //end of if let
                        self.parentView?.toastMessage(message: "Something went wrong")
                    }//end of if let
                    }
                   
                }//api call
    }

}//class
