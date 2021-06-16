//
//  HomeScreenDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 07/06/21.
//

import UIKit

class HomeScreenDataSource: NSObject,NavigationDelegate {
   
    
    
    //MARK :- Delegate func called from collection view cell using another delegate
    func nextPage(tag: Int) {
        
        switch (tag) {
        case 0:
            let destinationController = AboutUsViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") 
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
            print("About IHMA")
        case 1:
            print("Homeopathy")
            let destinationController = ActivitiesViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ActivitiesViewController
            destinationController?.activity = "Homeopathy"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        case 2:
            print("Flash News")
            let destinationController = ActivitiesViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ActivitiesViewController
            destinationController?.activity = "Flash news"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        case 3:
            print("events")
            let destinationController = ActivitiesViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ActivitiesViewController
            destinationController?.activity = "Events"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        case 4:
            print("SOH")
            let destinationController = ActivitiesViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ActivitiesViewController
            destinationController?.activity = "SOH"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        case 5:
            print("Articles")
            let destinationController = ActivitiesViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ActivitiesViewController
            destinationController?.activity = "Articles"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        case 6:
            print("Institutions")
            let destinationController = ActivitiesViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ActivitiesViewController
            destinationController?.activity = "Institutions"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
            
        case 7:
            print("IHRC")
            let destinationController = ActivitiesViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ActivitiesViewController
            destinationController?.activity = "IHRC"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        default:
            break
        }

        
    }
    
   
    
    weak var parentView: HomeScreenViewController?
    
    init(attachView: HomeScreenViewController) {
        super.init()
        self.parentView = attachView
        attachView.homeTableView.delegate = self
        attachView.homeTableView.dataSource = self
        parentView?.sideMenu()
    }
    
}

//Mark:- Datasource and delegate methods
extension HomeScreenDataSource:UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0 || indexPath.row == 2) {
            let cell = (self.parentView?.homeTableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath))! as? TitleTableViewCell
            switch  (indexPath.row) {
            case 0:
                cell?.titleLabel.text = "Collaborations"
            case 2:
                cell?.titleLabel.text = "Research Activities"
            default:
                break
            }
            return cell!
        } else if (indexPath.row == 3) {
            let cell = (self.parentView?.homeTableView.dequeueReusableCell(withIdentifier: "Activities", for: indexPath))! as? ActivitiesTableViewCell
            cell!.navigationDelegate = self
            return cell!
        }
        let cell = (self.parentView?.homeTableView.dequeueReusableCell(withIdentifier: "Carousel", for: indexPath))!   as? CarouselTableViewCell
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0 || indexPath.row == 2) {
            return 50
        } else if (indexPath.row == 1)
        {
            if UIScreen.main.bounds.height < 750 {
                return (parentView?.homeTableView.frame.height)! / 2.6
            } else {
                return (parentView?.homeTableView.frame.height)! / 3.2
            }
            
            
        }
        return (parentView?.homeTableView.frame.height)! / 2;//3 changed to 2  Choose your custom row height
    }
}
