//
//  ReturnPolicyViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 20/07/21.
//

import UIKit

class ReturnPolicyViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    

    func setupUI() {
        view.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"1B88F1")
    }

}
