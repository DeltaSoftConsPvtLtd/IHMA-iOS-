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
        ChapterParser.shared.parserFile(Chapters_List) { (status,msg,resp) in
            if status{
                let response = resp as! ChaptersModel
                print(response.districts![1].district)
                chaptersArray.removeAll()
                
                
                if(states != "" )
                {
                    
                    for index in 0...((response.districts![x].chapters?.count)!-1)
                    {
//                        districtsArray[index] = response.states![x].districts![index]
                        chaptersArray.append(response.districts![x].chapters![index])
                    }
                    self.parentView?.chapterListTableView.reloadData()
                } else {
                    for index in 0...((response.districts?.count)!-1)
                    {
                        if  ( (response.districts![index].district) != nil) {
                        chapterDistrictArray.append((response.districts![index].district)!)
                        }
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
        return chaptersArray.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        if indexPath.row == 0 {
        let cell = (self.parentView?.chapterListTableView.dequeueReusableCell(withIdentifier: "dropDown", for: indexPath))!  as? ChaptersTableViewCell
        
            cell?.lblTitle.text = "District"
            cell?.dropDown.dataSource = chapterDistrictArray
            cell?.backgroundColor = UIColor.white
            //to change the color of a dropdown
            cell?.dropDownView.backgroundColor = UIColor.clear
            cell?.dropDown.backgroundColor = UIColor.white
            
            cell?.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
            cell?.lblList.text = chapterDistrictArray[index]
            states = (cell?.lblList.text!)!
            parsingData(x: index)
        }
            if(states != "" )
            {
                cell?.lblList.text = states
            }

        return cell!
        } else if (indexPath.row == (chaptersArray.count+1)) {
            let cell = (self.parentView?.chapterListTableView.dequeueReusableCell(withIdentifier: "hyperLink", for: indexPath))
            cell?.backgroundColor = UIColor.white
            return cell!
        } else {
            let cell = (self.parentView?.chapterListTableView.dequeueReusableCell(withIdentifier: "List", for: indexPath))!  as? ListTableViewCell
            if states != "" {
                cell?.lblList.text = chaptersArray[indexPath.row-1]
            } else{
                cell?.lblList.text = ""
            }
            return cell!
        }
        let cell = (self.parentView?.chapterListTableView.dequeueReusableCell(withIdentifier: "List", for: indexPath))!  as? ListTableViewCell
        cell?.lblList.text = chaptersArray[indexPath.row-2]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 2 {
            return 80
        }
        return 50
        
    }
}
