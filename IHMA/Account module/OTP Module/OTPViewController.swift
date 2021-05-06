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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gradientTwoColors()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
