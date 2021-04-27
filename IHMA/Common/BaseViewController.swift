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

    //method for displaying toast msg
    func toastMessage(message : String)
    {
        
        DispatchQueue.main.async {

        let toastLabel =
            UILabel(frame:
                CGRect(x: self.view.frame.size.width/2-130,
                       y: self.view.frame.size.height - 100,
                       width: 250,
                       height: 35))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(toastLabel)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        UIView.animate(withDuration: 4.0, animations: {
            toastLabel.alpha = 0.0
        })
        }
    }
}
