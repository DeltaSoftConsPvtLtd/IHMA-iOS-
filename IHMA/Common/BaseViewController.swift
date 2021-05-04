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
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Function to specify gradient color for view
    func gradientColors() {
      view.backgroundColor = UIColor.clear
      let backgroundLayer = colors.gl
      backgroundLayer!.frame = view.frame
      view.layer.insertSublayer(backgroundLayer!, at: 0)
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
   
    //MARK:- hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
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
    
    //MARK:- validation for password
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    //MARK:- validation for username
    func isValidInput(Input:String) -> Bool {
        let RegEx = "\\w{7,18}"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Input)
    }
    
    //MARK:- validation of email
    func isValidEmail(testStr:String) -> Bool {
        
        print("validate emilId: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
        
    }
}
