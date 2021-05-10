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
    @IBOutlet weak var separatorView: UIView!
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
        

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Function to specify gradient color for view
    func gradientColors() {
      view.backgroundColor = UIColor.clear
      let backgroundLayer = colors.gl
      backgroundLayer!.frame = view.frame
      view.layer.insertSublayer(backgroundLayer!, at: 0)
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
    
    
    
    
    
   
  
    @IBAction func tab1Tap(_ sender: Any) {
        lblTab1.textColor = UIColor.blue
        imgTab1.setImageColor(color: UIColor.blue)
        
        //tab2
        lblTab2.textColor = UIColor.black
        imgtab2.setImageColor(color: UIColor.black)
        
        //tab3
        lblTab3.textColor = UIColor.black
        imgTab3.setImageColor(color: UIColor.black)
        
        let destinationController = ViewController2 .instantiateViewControllerFromStoryboard(storyBoardName: "Main")
        self.navigationController?.pushViewController(destinationController!, animated: true)
    }
    
    @IBAction func tab2Tap(_ sender: Any) {
        //tab1
        lblTab1.textColor = UIColor.black
        imgTab1.setImageColor(color: UIColor.black)
        
        //tab2
        lblTab2.textColor = UIColor.blue
        imgtab2.setImageColor(color: UIColor.blue)
        
        //tab3
        lblTab3.textColor = UIColor.black
        imgTab3.setImageColor(color: UIColor.black)
        
        let destinationController = SideMenuViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main")
        self.navigationController?.pushViewController(destinationController!, animated: true)
    }
    
    @IBAction func tab3Tap(_ sender: Any) {
        //tab1
        lblTab1.textColor = UIColor.black
        imgTab1.setImageColor(color: UIColor.black)
        
        //tab2
        lblTab2.textColor = UIColor.black
        imgtab2.setImageColor(color: UIColor.black)
        
        //tab3
        lblTab3.textColor = UIColor.blue
        imgTab3.setImageColor(color: UIColor.blue)
        
        let destinationController = NotificationViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main")
        self.navigationController?.pushViewController(destinationController!, animated: true)
    }
}
