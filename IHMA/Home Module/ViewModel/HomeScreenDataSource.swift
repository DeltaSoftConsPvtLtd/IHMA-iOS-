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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0) {
            let cell = (self.parentView?.homeTableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath))!
            return cell
        }
        let cell = (self.parentView?.homeTableView.dequeueReusableCell(withIdentifier: "Carousel", for: indexPath))!   as? CarouselTableViewCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 50
        }
        return (parentView?.homeTableView.frame.height)! / 3;//Choose your custom row height
    }
}
