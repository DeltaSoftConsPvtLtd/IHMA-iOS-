//
//  SideMenuViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 22/04/21.
//

import UIKit
import SideMenu

class SideMenuViewController: UIViewController {

    var menu:SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //for side menu nvigation
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)

        // Do any additional setup after loading the view.
    }
    //MARK:- action for side menu button
    @IBAction func didTapMenu() {
        present(menu!, animated: true)
    }


}


//MARK:-List items for side menu
class MenuListController: UITableViewController {
    var items = ["Profile","Login", "Register","Courses","Privacy policy"]
    
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
        return cell
    }
}
