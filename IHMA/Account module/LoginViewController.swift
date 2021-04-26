//
//  LoginViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 26/04/21.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    
    var authentication = Authentication()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButton(_ sender: Any) {
        guard let userName = self.txtUsername.text else {return}
        guard let password = self.txtPassword.text else {return}
        authentication.authenticateUserWith(userName, andPassword: password)
        authentication.loginCompletionHandler { [weak self](status, message) in
            guard let self = self else {return}
            if status {
                self.lblMessage.text = "Logged in with username == \(self.authentication.username) and email == \(self.authentication.email)"
                self.lblMessage.isHidden = false
            } else {
                self.lblMessage.text = message
                self.lblMessage.isHidden = false
                //message
            }
            
        }//login completion handler
    }
    
}
