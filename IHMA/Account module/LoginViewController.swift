//
//  LoginViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 26/04/21.
//

import UIKit

class LoginViewController: BaseViewController, UITextFieldDelegate {

    //MARK:- constraint outlets
    
    @IBOutlet weak var imgTopConstraint: NSLayoutConstraint!
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
        constraintSettings()
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
//        authentication.authenticateUserWith(userName, andPassword: password)
        if userName.count != 0 {
            if password.count != 0 {
                if (userName == "test2" && password == "arjunnair") {
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let tabbar: UITabBarController? = (storyBoard.instantiateViewController(withIdentifier: "MainTabPage") as? UITabBarController)
                    //MARK:- to change the color of tabbar
                    tabbar?.tabBar.barTintColor = UIColor.white
                    self.navigationController?.pushViewController(tabbar!, animated: true)
                }
                else {
                    self.toastMessage(message: "invalid credentials")
                    txtUsername.text = ""
                    txtPassword.text = ""
                    txtUsername.becomeFirstResponder()
                }
//
//                loginAPI(userName, password)
//                doLogin(userName, password)
            } else {
                //Password empty
                self.toastMessage(message: "Password should not be empty")
            }
        } else {
            //username empty
            self.toastMessage(message: "Username should not be empty")
        }
        
    }
    
    func doLogin(_ user: String, _ psw :String)
    {
        let url = URL(string: "http://Lmsihma.co.in:81/api/login/")
        let session = URLSession.shared
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let paramToSend = "username=" + user + "&password=" + psw
        
        request.httpBody = paramToSend.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            guard let _: Data = data else
            {
                return
            }
            
            let json:Any?
            
            do{
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            }
            catch{
                return
            }
            
            guard let server_response = json as? NSDictionary else
            {
                return
            }
            
            if let data_block = server_response["token"] //as? NSDictionary
            {
//                if let session_data = data_block["session"] as? String
//                {
                    let preferences = UserDefaults.standard
                    preferences.set(data_block, forKey: "session")
                    
//                    DispatchQueue.main.async {
//                        execute : self.LoginDone()
//                    }
//                }
            }
        })
        task.resume()
        
    }
    func loginAPI(_ user: String, _ psw :String) {
        WebServiceManager.sharedInstance.signInUser(username: user, password: psw) { (status, msg, resp, err) in
            print("new status \(msg)")
                    if status{
                        
                    }
                }
    }
    
    func LoginDone() {
        
    }
    
   
}



