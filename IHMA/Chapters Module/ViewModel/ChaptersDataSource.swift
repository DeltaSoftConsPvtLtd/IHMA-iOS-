//
//  ChaptersDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 17/06/21.
//

import UIKit

class ChaptersDataSource: NSObject {
    weak var parentView: ChaptersViewController?
    init(attachView: ChaptersViewController) {
        super.init()
        self.parentView = attachView
        attachView.chapterListTableView.delegate = self
        attachView.chapterListTableView.dataSource = self
       
    }
}

//Mark:- Datasource and delegate methods
extension ChaptersDataSource:UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = (self.parentView?.chapterListTableView.dequeueReusableCell(withIdentifier: "dropDown", for: indexPath))!  as? ChaptersTableViewCell
        cell?.dropDown.dataSource = statesArray
        cell?.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            cell?.lblList.text = statesArray[index]
//            states = cell.lblTitle.text!
//            parsingData(x: index)
//            if(states != nil )
//            {
//                cell.lblTitle.text = states
//            }
        }

        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
}
