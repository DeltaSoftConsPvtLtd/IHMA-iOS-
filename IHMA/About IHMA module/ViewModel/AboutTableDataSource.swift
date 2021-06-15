//
//  AboutTableDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 14/06/21.
//

import UIKit

class AboutTableDataSource: NSObject {
    weak var parentView: AboutUsViewController?
    
    init(attachView: AboutUsViewController) {
        super.init()
        self.parentView = attachView
        attachView.aboutTableView.delegate = self
        attachView.aboutTableView.dataSource = self
    }
    
    @objc func seemoreBtnTapped(sender:UIButton) {
        print("tapped")
    }
}

//Mark:- Delegate Methods
extension AboutTableDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//Mark:- Datasource methods
extension AboutTableDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.parentView?.titles.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 1) {
            let cell = (self.parentView?.aboutTableView.dequeueReusableCell(withIdentifier: "bearer", for: indexPath))! as? officeBearerTableViewCell
            cell?.bearerView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"2CBFD8")
            cell?.lblBearer?.text = "Office Bearers"
            return cell!
        } else {
            let cell = (self.parentView?.aboutTableView.dequeueReusableCell(withIdentifier: "about", for: indexPath))! as? ChapterTableViewCell
            cell?.lblTitle?.text = "Chapters"
            cell?.btnSeeMore.layer.cornerRadius = (cell?.btnSeeMore.frame.size.height)!/2 // this value vary as per your desire
            cell?.chapterView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"2CC2D7")
            cell!.btnSeeMore.addTarget(self, action: #selector(seemoreBtnTapped(sender:)),
                                        for: UIControl.Event.touchUpInside)
            return cell!
        }
        let cell = (self.parentView?.aboutTableView.dequeueReusableCell(withIdentifier: "about", for: indexPath))! as? ChapterTableViewCell
      
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 1) {
            return 250
        }
        return 175
    }
}
