//
//  LoginViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 26/04/21.
//

import UIKit
import Alamofire

class LoginViewController: BaseViewController {

    //MARK:- constraint outlets
    
    @IBOutlet weak var imgTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var imgLogo: UIImageView!
    
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var usernameView: UIView!
    
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    
    var parameters : [String : Any]?
    var authentication:Authentication?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        constraintSettings()
        self.authentication = Authentication(attachView: self)
    }
    
    
    
    func updateUI() {
        txtUsername.becomeFirstResponder()
        
        loginView.layer.cornerRadius = loginView.bounds.height/2;
        loginView.clipsToBounds  =  true
        loginView.backgroundColor = UIColor.white
        lblTitle.textColor = .white
        txtUsername.addUnderLine()
        txtPassword.addUnderLine()
        
        lblUsername.textColor = .white
        lblPassword.textColor = .white
       
        imgLogo.makeRounded()
    }
    
    //MARK:- update constraint for screen sizes
    func constraintSettings() {
        if UIScreen.main.bounds.height < 850
        {
            imgTopConstraint.constant = 90.0
        }
        else{
            imgTopConstraint.constant = 150.0
        }
    }

    @IBAction func btmForgotPassword(_ sender: Any) {
    }
    
    @IBAction func loginButton(_ sender: Any) {
        guard let userName = self.txtUsername.text else {return}
        guard let password = self.txtPassword.text else {return}
        authentication!.authenticateUserWith(userName, andPassword: password)
//        if userName.count != 0 {
//            if password.count != 0 {
//
//                loginAPI(userName, password)
//
//            } else {
//                //Password empty
//                self.toastMessage(message: "Password should not be empty")
//            }
//        } else {
//            //username empty
//            self.toastMessage(message: "Username should not be empty")
//        }
        
    }

   
//    func loginAPI(_ user: String, _ psw :String) {
//
//
//        let url = "\(baseUrl)\(userSignIn)"
//        let post = Post_Model(username: user, password: psw)
//        ApiClient.shared.getData(url, post, LoginModel.self) { (sucess, resp, msg) in
//                    if sucess{
//                        print(resp)
//                        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//                        let tabbar: UITabBarController? = (storyBoard.instantiateViewController(withIdentifier: "MainTabPage") as? UITabBarController)
//                        //MARK:- to change the color of tabbar
//                        tabbar?.tabBar.barTintColor = UIColor.white
//                        self.navigationController?.pushViewController(tabbar!, animated: true)
//                    }
//                    else{
//                        self.toastMessage(message: "invalid credentials")
//                        self.txtUsername.text = ""
//                        self.txtPassword.text = ""
//                        self.txtUsername.becomeFirstResponder()
//                    }
//                }//api call
//    }
   
    
}//Class



