//
//  HomeScreenViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 07/06/21.
//

import UIKit

class HomeScreenViewController: BaseViewController{

    @IBOutlet weak var sideMenuImage: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var homeTableView: UITableView!
    
    @IBOutlet weak var logoImg: UIImageView!
    var homeScreenDataSource: HomeScreenDataSource?
    
    var flashNewsArray = [String]()
    var eventsArray = [String]()
    var notificationsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientTwoColors()
        logoImg.makeRounded()
        activityIndicator.isHidden = true
        
        //MARK:- API call
        eventsAPI()
        
//        HomeScreenViewController.delegate = self
        

        // Do any additional setup after loading the view.
        self.homeScreenDataSource = HomeScreenDataSource(attachView: self)
    }
    
    
    //MARK:- Course API
    func eventsAPI() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        let url = "\(testUrl)\(eventsList)"
        let post = Param_Model()
        ApiClient.shared.getData("GET", url, post, EventsModel.self) { [self] (sucess, resp, msg) in
                    if sucess{
                        let response = resp as! EventsModel
                        print(response.status?.type!)
                        print(response.data![0].status)
                        print(resp)
                        let x = response.data![0].details?.flash_News?.count
                        flashNewsArray.removeAll()
                        for index in 0...x!-1
                        {
//                        flashNewsArray[index] = (response.data![0].details?.flash_News![index].name)!
                            flashNewsArray.append((response.data![0].details?.flash_News![index].name)!)
                        }
                        
                        
                        let y = response.data![0].details?.events?.count
                        eventsArray.removeAll()
                        for index in 0...y!-1
                        {
//                        flashNewsArray[index] = (response.data![0].details?.flash_News![index].name)!
                            eventsArray.append((response.data![0].details?.events![index].name)!)
                        }
                        
                        let z = response.data![0].details?.notifications?.count
                        notificationsArray.removeAll()
                        for index in 0...z!-1
                        {
//                        flashNewsArray[index] = (response.data![0].details?.flash_News![index].name)!
                            notificationsArray.append((response.data![0].details?.notifications![index].name)!)
                        }
                        activityIndicator.stopAnimating()
                        activityIndicator.isHidden = true
                    }
        }//end of api
        
    }
    


}
