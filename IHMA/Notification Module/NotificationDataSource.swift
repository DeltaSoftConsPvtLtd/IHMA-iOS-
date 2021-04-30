//
//  NotificationDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 30/04/21.
//

import UIKit

class NotificationDataSource: NSObject {
    weak var parentView: NotificationViewController?
    
    init(attachView: NotificationViewController) {
        super.init()
        self.parentView = attachView
        attachView.notificationTableView.delegate = self
        attachView.notificationTableView.dataSource = self
    }
}

extension NotificationDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


//Mark:- Datasource methods
extension NotificationDataSource: UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.parentView?.status.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (self.parentView?.notificationTableView.dequeueReusableCell(withIdentifier: "Notification", for: indexPath))! as? NotificationTableViewCell
        cell?.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"CC2B2B")
        cell?.notificationCellView?.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"CC2B2B")
        cell?.dateView?.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"C12524")
        cell?.lblDay?.text = (self.parentView?.date[indexPath.row])!
        cell?.lblDescription?.text = (self.parentView?.descriptions[indexPath.row])!
        cell?.lblStatus?.text = (self.parentView?.status[indexPath.row])!
        
//        cell?.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"176AB5")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }

    
}
