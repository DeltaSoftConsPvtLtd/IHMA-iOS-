//
//  SideMenuViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 22/04/21.
//

import UIKit


class SideMenuViewController: BaseViewController {

    
    let courses = [["Swift", "Java", "Python"],
                 ["Objective C", "Android"],
                 ["Photoshop"]]
    
    var tableDataSurce : TableDataSource?
    
    @IBOutlet weak var coursesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       sideMenu()
        
        self.tableDataSurce = TableDataSource(attachView: self)
        
        
        
    }
   
    


}



//MARK:-List items for side menu
class MenuListController: UITableViewController {
    var items = ["Profile","Login", "Register","Courses","Privacy policy"]
    let darkcolor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
//        cell.textLabel?.textColor = .white
//        cell.backgroundColor = darkcolor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let destinationController = RegistrationViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
//        self.navigationController?.pushViewController(destinationController!, animated: true)
        
        let destinationController = LoginViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
        self.navigationController?.pushViewController(destinationController!, animated: true)
    }
}
