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
//        downloadJson()
//        authentication.authenticateUserWith(userName, andPassword: password)
        if userName.count != 0 {
            if password.count != 0 {
                
                doLogin(userName, password)
            } else {
                //Password empty
                self.toastMessage(message: "Password should not be empty")
            }
        } else {
            //username empty
            self.toastMessage(message: "Username should not be empty")
        }
        
        
//        if(isValidEmail(testStr:txtUsername.text!) == true)
//        {
//            if (isPasswordValid(txtPassword.text!)==true) {
//                authentication.loginCompletionHandler { [weak self](status, message) in
//                    guard let self = self else {return}
//                    if status {
//                        self.toastMessage(message: "Success")
////                     self.lblMessage.text = "Logged in with username == \(self.authentication.username) and email == \(self.authentication.email)"
//                        self.lblTitle.isHidden = false
//                    } else {
//                        self.toastMessage(message: message)
////                self.lblMessage.text = message
//                        self.lblTitle.isHidden = false
//                //message
//                    }
//
//                }//login completion handler
//            } else
//            {
//                self.toastMessage(message: "invalid password")
//                txtPassword.text = ""
//                txtPassword.becomeFirstResponder()
//            }
//        } else {
//            self.toastMessage(message: "invalid username")
//            txtUsername.text = ""
//            txtUsername.becomeFirstResponder()
//        }
    }
    
    func doLogin(_ user: String, _ psw :String)
    {
        let url = URL(string: "13.232.14.192:81/api/login/")
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
            
            if let data_block = server_response["data"] as? NSDictionary
            {
                if let session_data = data_block["session"] as? String
                {
                    let preferences = UserDefaults.standard
                    preferences.set(session_data, forKey: "session")
                    
                    DispatchQueue.main.async {
//                        execute : self.LoginDone()
                    }
                }
            }
        })
        task.resume()
        
    }
    
    func LoginDone() {
        
    }
    
    func downloadJson() {

        let url = URL(string: "13.232.14.192:81/api/login/")
           guard let downloadURL = url else { return }
           //POST Req


           var request = URLRequest(url: downloadURL)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.addValue("application/json", forHTTPHeaderField: "Accept")
           let newpost = loginPost(email: "test2", password: "arjunnair")

           do {
               let jsonBody = try JSONEncoder().encode(newpost)

               request.httpBody = jsonBody
               print(jsonBody)
           }catch{
               print("some error")
           }

           URLSession.shared.dataTask(with: request) { data, urlResponse, error in
               guard let data = data, error == nil, urlResponse != nil else {
                   print("something is wrong with url")
                   return
               }

               print("downloaded..")
               do
               {
                   let decoder = JSONDecoder()
                   let downloaduser = try decoder.decode(User.self, from: data)

   //                self.logmessage = downloaduser.message!

   //                print(self.logmessage)


                   DispatchQueue.main.async {

                       // self.tableView.reloadData()
                   }
               } catch {
                   print("something wrong with decode")

               }
               }.resume()
       }
}



