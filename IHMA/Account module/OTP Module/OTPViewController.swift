//
//  OTPViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 06/05/21.
//

import UIKit

class OTPViewController: BaseViewController {

    @IBOutlet weak var OTPView: UIView!
    @IBOutlet weak var txtOTP1: UITextField!
    @IBOutlet weak var txtOTP2: UITextField!
    @IBOutlet weak var txtOTP3: UITextField!
    @IBOutlet weak var txtOTP4: UITextField!
    
    @IBOutlet weak var verifyButton: UIButton!
    var otpDataSource : OTPDataSource?
    
    var token:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        gradientTwoColors()
        // Do any additional setup after loading the view.
        self.otpDataSource = OTPDataSource(attachView: self)
    }
    
    func setupUI() {
        txtOTP1.backgroundColor = UIColor.clear
        txtOTP2.backgroundColor = UIColor.clear
        txtOTP3.backgroundColor = UIColor.clear
        txtOTP4.backgroundColor = UIColor.clear
        OTPView.backgroundColor = UIColor.clear
        
        addBottomBorder(textfield:txtOTP1)
        addBottomBorder(textfield:txtOTP2)
        addBottomBorder(textfield:txtOTP3)
        addBottomBorder(textfield:txtOTP4)
        
        verifyButton.layer.cornerRadius = 30
        txtOTP1.becomeFirstResponder()
    }
    
    func addBottomBorder(textfield:UITextField) {
        let layer = CALayer()
        layer.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"CBCBCB").cgColor//#CBCBCB
        layer.frame = CGRect(x: 0.0, y: textfield.frame.size.height - 2.0, width: textfield.frame.size.width, height: 2.0)
        textfield.layer.addSublayer(layer)
    }

   

}
