//
//  LoginViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 26/04/21.
//

import UIKit
import Alamofire

class LoginViewController: BaseViewController, UITextFieldDelegate {

    //MARK:- constraint outlets
    
    @IBOutlet weak var imgTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var imgLogo: UIImageView!
//    var authentication = Authentication()
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var usernameView: UIView!
    
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    
    var url:String?
    var parameters : [String : Any]?
    
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
//                if (userName == "test2" && password == "arjunnair") {
//                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//                    let tabbar: UITabBarController? = (storyBoard.instantiateViewController(withIdentifier: "MainTabPage") as? UITabBarController)
//                    //MARK:- to change the color of tabbar
//                    tabbar?.tabBar.barTintColor = UIColor.white
//                    self.navigationController?.pushViewController(tabbar!, animated: true)
//                }
//                else {
//                    self.toastMessage(message: "invalid credentials")
//                    txtUsername.text = ""
//                    txtPassword.text = ""
//                    txtUsername.becomeFirstResponder()
//                }
//
                loginAPI(userName, password)
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
//    func successHandler((json as! [String:AnyObject])) {
//        let response = JSON as! NSDictionary
//    }
   
    func loginAPI(_ user: String, _ psw :String) {

        url = "\(baseUrl)\(userSignIn)"
         parameters = [ "username":user,"password":psw] as [String : Any]
        Alamofire.request(URL.init(string: url!) as! URLConvertible, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { [self] (response) in
                 print(response.result)

                 switch response.result {

                 case .success(_):
                    var response:NSDictionary = response.value as! NSDictionary
                    print(response)
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let tabbar: UITabBarController? = (storyBoard.instantiateViewController(withIdentifier: "MainTabPage") as? UITabBarController)
                    //MARK:- to change the color of tabbar
                    tabbar?.tabBar.barTintColor = UIColor.white
                    self.navigationController?.pushViewController(tabbar!, animated: true)
                     break
                 case .failure(let error):
//                     failureHandler([error as Error])
                    print ("hi")
                    self.toastMessage(message: "invalid credentials")
                    self.txtUsername.text = ""
                    self.txtPassword.text = ""
                    self.txtUsername.becomeFirstResponder()
                     break
                 }
             }
//        WebServiceManager.sharedInstance.signInUser(username: user, password: psw) { (status, msg, resp, err) in
//            print("new status \(msg)")
//                    if status{
//
//                    }
//                }
    }
    
    func LoginDone() {
        
    }
    
   
}



