//
//  HomeScreenDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 07/06/21.
//

import UIKit

class HomeScreenDataSource: NSObject {
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
    
  
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return "Collaborations"
    }
    
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
//
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 120.0)) //set these values as necessary
//        returnedView.backgroundColor = UIColor.lightGray
//
//
//
//        let label = UILabel(
//            frame: CGRect(x: returnedView.frame.origin.x, y: returnedView.frame.origin.y - 44, width: returnedView.frame.size.width, height: returnedView.frame.size.height))//UILabel(frame: CGRectMake(labelX, labelY, labelWidth, labelHeight))
//        label.text = "Collaborations"
//        returnedView.addSubview(label)
//
//        return returnedView
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (self.parentView?.homeTableView.dequeueReusableCell(withIdentifier: "Carousel", for: indexPath))!   as? CarouselTableViewCell
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (parentView?.homeTableView.frame.height)! / 3;//Choose your custom row height
    }
}
