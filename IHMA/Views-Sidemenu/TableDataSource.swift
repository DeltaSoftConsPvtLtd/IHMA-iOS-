//
//  TableDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 25/04/21.
//

import UIKit

class TableDataSource: NSObject {

    weak var parentView: SideMenuViewController?
    
    init(attachView: SideMenuViewController) {
        super.init()
        self.parentView = attachView
        attachView.coursesTableView.delegate = self
        attachView.coursesTableView.dataSource = self
        
        //MARK:- adding headers and footers for table view
//        let header = UIView(frame: CGRect(x: 0, y: 0, width: attachView.coursesTableView.frame.size.width, height: 100))
//        let footer = UIView(frame: CGRect(x: 0, y: 0, width: attachView.coursesTableView.frame.size.width, height: 0))
        
//        header.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"176AB5")//.orange//hex color code :#176AB5
//        footer.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"176AB5")
        
//        let label = UILabel(frame: header.bounds)
//        label.text = "COURSES"
//        label.textColor = .white
//        label.textAlignment = .center
//        label.font = label.font.withSize(20)
//        header.addSubview(label)
//
//
//
//        self.parentView?.coursesTableView.tableHeaderView = header
//        self.parentView?.coursesTableView.tableFooterView = footer
        
    }
}


//Mark:- Delegate Methods
extension TableDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//Mark:-UIScrollView Delegate
extension TableDataSource: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y == 0)
        {
            parentView?.normalConstraints()
        } else
        {
            parentView?.updateConstraints()
        }
       
}
}
//Mark:- Datasource methods
extension TableDataSource: UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.parentView?.courses.count)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.parentView?.courses[section].count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (self.parentView?.coursesTableView.dequeueReusableCell(withIdentifier: "items", for: indexPath))! as? TableViewCell
        cell?.lblCourse?.text = (self.parentView?.courses[indexPath.section][indexPath.row])!
        cell?.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"176AB5")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }

    
}
