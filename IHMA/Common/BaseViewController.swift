//
//  BaseViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 23/04/21.
//

import UIKit
import SideMenu


class BaseViewController: UIViewController {

    //MARK:- Outlets of bottom tabbar
    @IBOutlet weak var TabbarView: UIView!
    @IBOutlet weak var tab1View: UIView!
    @IBOutlet weak var imgTab1: UIImageView!
    @IBOutlet weak var lblTab1: UILabel!
    @IBOutlet weak var btnTab1: UIButton!
    
    @IBOutlet weak var tab2View: UIView!
    @IBOutlet weak var imgtab2: UIImageView!
    @IBOutlet weak var btnTab2: UIButton!
    @IBOutlet weak var lblTab2: UILabel!
    
    @IBOutlet weak var tab3View: UIView!
    @IBOutlet weak var imgTab3: UIImageView!
    @IBOutlet weak var lblTab3: UILabel!
    @IBOutlet weak var btnTab3: UIButton!
    
    var menu:SideMenuNavigationController?
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
       
        //MARK:- to dismiss keyboard
             let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

           

            view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Function to specify gradient color for view
    func gradientColors() {
      view.backgroundColor = UIColor.clear
      let backgroundLayer = colors.gl
      backgroundLayer!.frame = view.frame
      view.layer.insertSublayer(backgroundLayer!, at: 0)
        }
    //Calls this function when the tap is recognized to dismiss keyboard.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func gradientTwoColors() {
      view.backgroundColor = UIColor.clear
      let backgroundLayer = colors.gradient
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
    
    //MARK:- Alert view
    func showAlertView(heading:String,message:String){
        DispatchQueue.main.async {

            let alert = UIAlertController(title: heading, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        }
        
    }
    
  
    @IBAction func tab1Tap(_ sender: Any) {
        lblTab1.textColor = UIColor.blue
        imgTab1.setImageColor(color: UIColor.blue)
        
        //tab2
        lblTab2.textColor = hexToUiColor().hexStringToUIColor(hex:"6E6E6E")//6E6E6E
        imgtab2.setImageColor(color: hexToUiColor().hexStringToUIColor(hex:"6E6E6E"))
         
        //tab3
        lblTab3.textColor = hexToUiColor().hexStringToUIColor(hex:"6E6E6E")
        imgTab3.setImageColor(color: hexToUiColor().hexStringToUIColor(hex:"6E6E6E"))
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let tabbar: UITabBarController? = (storyBoard.instantiateViewController(withIdentifier: "MainTabPage") as? UITabBarController)
        tabbar?.selectedIndex = 0
        //MARK:- to change the color of tabbar
        tabbar?.tabBar.barTintColor = UIColor.white
        self.navigationController?.pushViewController(tabbar!, animated: true)
    }
    
    
    @IBAction func tab2Tap(_ sender: Any) {
        //tab1
        lblTab1.textColor = hexToUiColor().hexStringToUIColor(hex:"6E6E6E")
        imgTab1.setImageColor(color: hexToUiColor().hexStringToUIColor(hex:"6E6E6E"))
        
        //tab2
        lblTab2.textColor = UIColor.blue
        imgtab2.setImageColor(color: UIColor.blue)
        
        //tab3
        lblTab3.textColor = hexToUiColor().hexStringToUIColor(hex:"6E6E6E")
        imgTab3.setImageColor(color: hexToUiColor().hexStringToUIColor(hex:"6E6E6E"))
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let tabbar: UITabBarController? = (storyBoard.instantiateViewController(withIdentifier: "MainTabPage") as? UITabBarController)
        tabbar?.selectedIndex = 1
        //MARK:- to change the color of tabbar
        tabbar?.tabBar.barTintColor = UIColor.white
        self.navigationController?.pushViewController(tabbar!, animated: true)
        
    }
    
    @IBAction func tab3Tap(_ sender: Any) {
        //tab1
        lblTab1.textColor = hexToUiColor().hexStringToUIColor(hex:"6E6E6E")
        imgTab1.setImageColor(color: hexToUiColor().hexStringToUIColor(hex:"6E6E6E"))
        
        //tab2
        lblTab2.textColor = hexToUiColor().hexStringToUIColor(hex:"6E6E6E")
        imgtab2.setImageColor(color: hexToUiColor().hexStringToUIColor(hex:"6E6E6E"))
        
        //tab3
        lblTab3.textColor = UIColor.blue
        imgTab3.setImageColor(color: UIColor.blue)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let tabbar: UITabBarController? = (storyBoard.instantiateViewController(withIdentifier: "MainTabPage") as? UITabBarController)
        tabbar?.selectedIndex = 2
        //MARK:- to change the color of tabbar
        tabbar?.tabBar.barTintColor = UIColor.white
        self.navigationController?.pushViewController(tabbar!, animated: true)
    }
    
    //MARK:- Email validation
    func isValidEmail(testStr:String) -> Bool {
                print("validate emilId: \(testStr)")
                let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
                let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
                return result
            }
    
    //MARK:- Phone number validation
    func validate(value: String) -> Bool {
                let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
                let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
                let result = phoneTest.evaluate(with: value)
                return result
            }
}
