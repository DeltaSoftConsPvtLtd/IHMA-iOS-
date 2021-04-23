//
//  BaseViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 23/04/21.
//

import UIKit
import SideMenu

class BaseViewController: UIViewController {

    var menu:SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        // Do any additional setup after loading the view.
    }
    
    //MARK:- to implement side menu
    func sideMenu() {
        
        //for side menu nvigation
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        
        
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    //MARK:- Back action
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }

    //MARK:- side menu button press
    @IBAction func didTapMenu() {
        present(menu!, animated: true)
    }

}
