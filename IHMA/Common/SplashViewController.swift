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
//    var chapterArray = ["Chapter 1","Chapter 2"]
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientTwoColors()
        setupUI()
        homeScreen()
//        courseAPI()
//        registrationApi()
    }
    
    func setupUI() {
        imgLogo.makeRounded()
        profileName = "Dr. Nancy Salmoren"
    }

    //MARK :- Navigation to home screen
    func homeScreen() {
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let destinationController = LoginViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
            self.navigationController?.pushViewController(destinationController!, animated: true)
//            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let tabbar: UITabBarController? = (storyBoard.instantiateViewController(withIdentifier: "MainTabPage") as? UITabBarController)
//            //MARK:- to change the color of tabbar
//            tabbar?.tabBar.barTintColor = UIColor.white
//            self.navigationController?.pushViewController(tabbar!, animated: true)
        }
    }
    //MARK:- Course API
    func courseAPI() {
        let url = "\(baseUrl)\(courses)"
        let post = Param_Model()
        ApiClient.shared.getData("GET", url, post, courseModel.self) { (sucess, resp, msg) in
                    if sucess{
                        let response = resp as! courseModel
                        print(response.status?.type!)
                        print(response.data![0].status)
                        print(resp)
                        
                    }
        }//end of api
        
    }
    //MARK:- Registration API
    func registrationApi () {
        let url = "\(baseUrl)\(userSignup)"
        let post = Param_Model()
        ApiClient.shared.getData("GET", url, post, getList.self) { [self] (sucess, resp, msg) in
                    if sucess{
                        let response = resp as! getList
                        print(response.status?.type!)
                        print(resp)
                        print(response.data![0].details?.memberFee![1].name)
                        
//                        chapterArray[0] = (response.data![0].details?.chapter![0].name)!
                    }
        }//end of api call
    }
}
