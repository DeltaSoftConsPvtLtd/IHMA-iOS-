//
//  SideMenuViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 22/04/21.
//

import UIKit


class SideMenuViewController: BaseViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       sideMenu()
        
        

        // Do any additional setup after loading the view.
    }
    //MARK:- action for side menu button
    


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
        let destinationController = RegistrationViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
        self.navigationController?.pushViewController(destinationController!, animated: true)
    }
}
