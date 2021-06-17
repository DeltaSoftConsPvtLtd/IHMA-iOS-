//
//  ChaptersDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 17/06/21.
//

import UIKit
import Foundation

class ChaptersDataSource: NSObject {
    
    weak var parentView: ChaptersViewController?
    
    var states:String = ""
    var district:String = ""
    var chaptersArray = ["","","Ernakulam","Kollam"]
    
    init(attachView: ChaptersViewController) {
        super.init()
        self.parentView = attachView
        attachView.chapterListTableView.delegate = self
        attachView.chapterListTableView.dataSource = self
        parsingData(x: 0)
       
    }
    
    func parsingData(x:Int) {
        //Mark:- parse json data
        Parser.shared.parserFile(File_List) { (status,msg,resp) in
            if status{
                let response = resp as! StatesModel
                print(response.states![1].state)
                districtsArray.removeAll()
                if(states != "" )
                {
                    
                    for index in 0...((response.states![x].districts?.count)!-1)
                    {
//                        districtsArray[index] = response.states![x].districts![index]
                        districtsArray.append(response.states![x].districts![index])
                    }
                    self.parentView?.chapterListTableView.reloadData()
                } else {
                    for index in 0...((response.states?.count)!-1)
                    {
                        statesArray.append((response.states![index].state)!)
                    }
                }
                

            }//End of if loop for status
        }//End of parser
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
        if indexPath.row < 2 {
        let cell = (self.parentView?.chapterListTableView.dequeueReusableCell(withIdentifier: "dropDown", for: indexPath))!  as? ChaptersTableViewCell
        switch indexPath.row  {
        case 0:
//            if states == "" {
//                cell?.lblList.text = "Select"
//            }
            cell?.lblTitle.text = "States"
            cell?.dropDown.dataSource = statesArray
            cell?.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
            cell?.lblList.text = statesArray[index]
            states = (cell?.lblList.text!)!
            parsingData(x: index)
        }
            if(states != "" )
            {
                cell?.lblList.text = states
            }

        
        case 1:
            cell?.lblTitle.text = "District"
            cell?.dropDown.dataSource = districtsArray
            cell?.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                cell?.lblList.text = districtsArray[index]
                district = (cell?.lblList.text!)!
                if(district != "" )
                {
                    cell?.lblList.text = district
                    self.parentView?.chapterListTableView.reloadData()
                }
            }
        default:
            cell?.dropDownView.isHidden = true
            cell?.lblTitle.text = ""
            break
        }
        return cell!
        } else {
            let cell = (self.parentView?.chapterListTableView.dequeueReusableCell(withIdentifier: "List", for: indexPath))!  as? ListTableViewCell
            if district != "" {
                cell?.lblList.text = chaptersArray[indexPath.row]
            } else{
                cell?.lblList.text = ""
            }
            return cell!
        }
        let cell = (self.parentView?.chapterListTableView.dequeueReusableCell(withIdentifier: "List", for: indexPath))!  as? ListTableViewCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 2 {
            return 80
        }
        return 50
        
    }
}
