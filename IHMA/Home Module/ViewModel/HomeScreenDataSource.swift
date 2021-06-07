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
extension HomeScreenDataSource:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        var sectionHeaderView: UIView?
//
//        sectionHeaderView = UIView(
//            frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 120.0))
//
//        sectionHeaderView?.backgroundColor = UIColor.red
//        let headerLabel = UILabel(
//            frame: CGRect(x: sectionHeaderView!.frame.origin.x, y: sectionHeaderView!.frame.origin.y - 44, width: sectionHeaderView!.frame.size.width, height: sectionHeaderView!.frame.size.height))
//
//        headerLabel.backgroundColor = UIColor.clear
//        headerLabel.text = "Section"
//        sectionHeaderView?.addSubview(headerLabel)
//
//        return sectionHeaderView
//    }
  
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Collaborations"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (self.parentView?.homeTableView.dequeueReusableCell(withIdentifier: "Carousel", for: indexPath))!   as? CarouselTableViewCell
        cell!.lbl.text = "hi"
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;//Choose your custom row height
    }
}
