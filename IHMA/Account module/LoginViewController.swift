//
//  LoginViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 26/04/21.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var imgLogo: UIImageView!
    var authentication = Authentication()
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var usernameView: UIView!
    
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    
   
    
    
    func updateUI() {
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

    @IBAction func btmForgotPassword(_ sender: Any) {
    }
    
    @IBAction func loginButton(_ sender: Any) {
        guard let userName = self.txtUsername.text else {return}
        guard let password = self.txtPassword.text else {return}
        authentication.authenticateUserWith(userName, andPassword: password)
        if (isPasswordValid(txtPassword.text!)==true) {
            authentication.loginCompletionHandler { [weak self](status, message) in
                guard let self = self else {return}
                if status {
                    self.toastMessage(message: "Success")
//                    self.lblMessage.text = "Logged in with username == \(self.authentication.username) and email == \(self.authentication.email)"
                    self.lblTitle.isHidden = false
                } else {
                    self.toastMessage(message: message)
//                self.lblMessage.text = message
                    self.lblTitle.isHidden = false
                //message
            }
            
        }//login completion handler
        }
    }
    
}



