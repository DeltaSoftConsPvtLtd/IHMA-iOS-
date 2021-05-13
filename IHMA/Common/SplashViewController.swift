//
//  SplashViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 05/05/21.
//

import UIKit

class SplashViewController: BaseViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientTwoColors()
        setupUI()

        
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let tabbar: UITabBarController? = (storyBoard.instantiateViewController(withIdentifier: "MainTabPage") as? UITabBarController)
            //MARK:- to change the color of tabbar
            tabbar?.tabBar.barTintColor = UIColor.white
            self.navigationController?.pushViewController(tabbar!, animated: true)
        }
      
    }
    
    func setupUI() {
        imgLogo.makeRounded()
        profileName = "Dr. Nancy Salmoren"
    }

}
