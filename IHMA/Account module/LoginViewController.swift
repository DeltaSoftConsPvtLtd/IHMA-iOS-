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
    
    @IBOutlet weak var loginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        txtUsername.addUnderLine()
        txtPassword.addUnderLine()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func updateUI() {
        loginView.layer.cornerRadius = loginView.bounds.height/2;
        loginView.clipsToBounds  =  true
        loginView.backgroundColor = UIColor.white
       
    }

    
    @IBAction func loginButton(_ sender: Any) {
        guard let userName = self.txtUsername.text else {return}
        guard let password = self.txtPassword.text else {return}
        authentication.authenticateUserWith(userName, andPassword: password)
        authentication.loginCompletionHandler { [weak self](status, message) in
            guard let self = self else {return}
            if status {
                self.toastMessage(message: "Success")
//                self.lblMessage.text = "Logged in with username == \(self.authentication.username) and email == \(self.authentication.email)"
                self.lblMessage.isHidden = false
            } else {
                self.toastMessage(message: message)
//                self.lblMessage.text = message
                self.lblMessage.isHidden = false
                //message
            }
            
        }//login completion handler
    }
    
}

//MARK:- to add underline for text field
extension UITextField {

    func addUnderLine () {
           let bottomLine = CALayer()
           
           bottomLine.frame = CGRect(x: 0.0, y: self.bounds.height + 3, width: self.bounds.width, height: 1.5)
           bottomLine.backgroundColor = UIColor.lightGray.cgColor
           
           self.borderStyle = UITextField.BorderStyle.none
           self.layer.addSublayer(bottomLine)
       }

}
