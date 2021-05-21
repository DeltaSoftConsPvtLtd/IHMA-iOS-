//
//  AboutUsViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 21/05/21.
//

import UIKit

class AboutUsViewController: BaseViewController {

 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        sideMenu()
        
     

        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        view.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"176AB5")
        
    }
    
}
