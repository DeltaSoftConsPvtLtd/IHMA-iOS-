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
    
    @IBOutlet weak var coursesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       sideMenu()
        
//        //MARK:- Delegate and Datasource for tableview
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        
        //MARK:- adding headers and footers for table view
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        
        header.backgroundColor = .orange
        footer.backgroundColor = .green
        
        let label = UILabel(frame: header.bounds)
        label.text = "Courses"
        label.textAlignment = .center
        header.addSubview(label)
        
        coursesTableView.tableHeaderView = header
        coursesTableView.tableFooterView = footer
        
    }
   
    


}

//Mark:- Delegate Methods
extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//Mark:- Datasource methods
extension SideMenuViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = coursesTableView.dequeueReusableCell(withIdentifier: "items", for: indexPath)
        cell.textLabel?.text = courses[indexPath.section][indexPath.row]
        cell.backgroundColor = .red
        return cell
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
        let destinationController = RegistrationViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
        self.navigationController?.pushViewController(destinationController!, animated: true)
    }
}
