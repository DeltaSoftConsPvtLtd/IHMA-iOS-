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
    
    @IBOutlet weak var btnSecureEntry: UIButton!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
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
        activityIndicator.isHidden = true
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
    @IBAction func btnSecureTextEntry(_ sender: Any) {
        txtPassword.isSecureTextEntry.toggle()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        //MARK:- Activity Indicator
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        loginView.isUserInteractionEnabled = false
        
        guard let userName = self.txtUsername.text else {return}
        guard let password = self.txtPassword.text else {return}
        authentication!.authenticateUserWith(userName, andPassword: password)
    }

}




