//
//  SplashViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 05/05/21.
//

import UIKit

class SplashViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gradientTwoColors()
        
        let destinationController = ViewController2 .instantiateViewControllerFromStoryboard(storyBoardName: "Main")
        self.navigationController?.pushViewController(destinationController!, animated: true)
        
//        var storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        var tabbar: UITabBarController? = (storyBoard.instantiateViewController(withIdentifier: "MainTabPage") as? UITabBarController)
//        navigationController?.pushViewController(tabbar!, animated: true)

//        let destinationController = MainTabPage.instantiateViewControllerFromStoryboard(storyBoardName: "MainTabPage")
//        self.navigationController?.pushViewController(destinationController!, animated: true)
//        if let tabViewController = storyboard!.instantiateViewController(withIdentifier: "MainTabPage") as? MainTabPage {
//            present(tabViewController, animated: true, completion: nil)
//        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
