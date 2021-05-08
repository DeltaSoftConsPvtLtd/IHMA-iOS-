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
        
//        let destinationController = ViewController2 .instantiateViewControllerFromStoryboard(storyBoardName: "Main")
//        self.navigationController?.pushViewController(destinationController!, animated: true)
        
        
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let tabbar: UITabBarController? = (storyBoard.instantiateViewController(withIdentifier: "MainTabPage") as? UITabBarController)
            //MARK:- to change the color of tabbar
            tabbar?.tabBar.barTintColor = UIColor.white
            self.navigationController?.pushViewController(tabbar!, animated: true)
        }

//        let destinationController = MainTabPage.instantiateViewControllerFromStoryboard(storyBoardName: "MainTabPage")
//        self.navigationController?.pushViewController(destinationController!, animated: true)
//        if let tabViewController = storyboard!.instantiateViewController(withIdentifier: "MainTabPage") as? MainTabPage {
//            present(tabViewController, animated: true, completion: nil)
//        }
    }
    
    func setupUI() {
        imgLogo.makeRounded()
    }

}
