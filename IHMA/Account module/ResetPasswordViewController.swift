//
//  ResetPasswordViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 04/06/21.
//

import UIKit

class ResetPasswordViewController: BaseViewController {

  
   
    @IBOutlet weak var lblNewPassword: UILabel!
    @IBOutlet weak var txtNewPassword: UITextField!
    
    @IBOutlet weak var resetPasswordView: UIView!
    @IBOutlet weak var lblConfirmPassword: UILabel!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var imgSecureTextEntryConfPassword: UIImageView!
    @IBOutlet weak var imgSecureTextEntry: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientTwoColors()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        resetPasswordView.layer.cornerRadius = resetPasswordView.bounds.height/2;
        resetPasswordView.clipsToBounds  =  true
        resetPasswordView.backgroundColor = UIColor.white
        txtNewPassword.addUnderLine()
        txtConfirmPassword.addUnderLine()
        imgSecureTextEntry.image = UIImage(named: "eye")
        imgSecureTextEntryConfPassword.image = UIImage(named: "eye")
    }

    
}

//Mark:- Actions
extension ResetPasswordViewController {
    @IBAction func btnNewPasswordTap(_ sender: Any) {
        txtNewPassword.isSecureTextEntry.toggle()
        if (imgSecureTextEntry.image == UIImage(named: "eye")) {
            imgSecureTextEntry.image = UIImage(named: "closingeye")

        } else {
            imgSecureTextEntry.image = UIImage(named: "eye")

        }
    }
    
    @IBAction func btnConfirmPasswordTap(_ sender: Any) {
        txtConfirmPassword.isSecureTextEntry.toggle()
        if (imgSecureTextEntryConfPassword.image == UIImage(named: "eye")) {
            imgSecureTextEntryConfPassword.image = UIImage(named: "closingeye")

        } else {
            imgSecureTextEntryConfPassword.image = UIImage(named: "eye")

        }
    }
}
