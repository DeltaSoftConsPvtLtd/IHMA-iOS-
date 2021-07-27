//
//  PaymentDetailsViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 27/07/21.
//

import UIKit

class PaymentDetailsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        view.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"1B88F1")
    }
   

}
