//
//  ActivityDatasource.swift
//  IHMA
//
//  Created by Nikil Davis on 15/06/21.
//

import UIKit

class ActivityDatasource: NSObject {
    weak var parentView: ActivitiesViewController?

    init(attachView: ActivitiesViewController) {
        super.init()
        self.parentView = attachView
        attachView.activityTableView.delegate = self
        attachView.activityTableView.dataSource = self
       
    }
}

//Mark:- Datasource and delegate methods
extension ActivityDatasource:UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (parentView?.objectivesArray.count != 0) {
            return (parentView?.objectivesArray.count)!
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = (self.parentView?.activityTableView.dequeueReusableCell(withIdentifier: "activity", for: indexPath))!  as? ActivityTableViewCell
        if (parentView?.objectivesArray.count != 0) {
            cell?.lblActivity.text = parentView?.objectivesArray[indexPath.row]
        } else {
//            parentView?.showAlertView(heading: "No New Updates", message: " \((parentView?.activity)!) has no new updates")
            parentView?.toastMessage(message: "\((parentView?.activity)!) has no new updates")
            cell?.lblActivity.text = ""
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
