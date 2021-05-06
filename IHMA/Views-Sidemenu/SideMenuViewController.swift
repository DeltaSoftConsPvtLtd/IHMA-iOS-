//
//  SideMenuViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 22/04/21.
//

import UIKit


class SideMenuViewController: BaseViewController {

    //MARK:- Header for tableview outlet
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var txtViewHeader: UITextView!
    
    //constraint outlets
    @IBOutlet weak var searchTopViewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewTable: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var imgMenu: UIImageView!
    @IBOutlet weak var txtLabel: UILabel!{
        didSet{
            txtLabel.numberOfLines = 2
            txtLabel.lineBreakMode = .byWordWrapping
            txtLabel.text = "Choose                        Your Course"
            txtLabel.font = setFontRegular(30.0)
            txtLabel.textColor = UIColor.white
            txtLabel.frame.size.width = 300
            txtLabel.sizeToFit()
        }
    }
    let courses = [["CECP", "MOST"],
                 ["Objective C", "Android"],
                 ["Photoshop"]]
    
    var tableDataSurce : TableDataSource?
    
    @IBOutlet weak var coursesTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        sideMenu()
        
        self.tableDataSurce = TableDataSource(attachView: self)
        
    }
    
    //MARK:- Search results
    func getsearchResults() {
      
    }
    
        
   
    
    func updateUI() {
        imgMenu.isHidden = false
        searchView.layer.cornerRadius = 30//searchView.bounds.height/2;
        searchView.clipsToBounds  =  true
        viewTable.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
        viewTable.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"176AB5")
        
        searchTextField.borderStyle = .none
        
        HeaderView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"176AB5")
    }
    
    func updateConstraints()
    {
       
               
        UIView.animate(withDuration: 0.3, animations: {() -> Void in

            self.imgMenu.isHidden = true
            self.searchTopViewConstraint.constant = 0.0
//            self.tableViewBottomConstraint.constant = 0.0
//            self.searchView.layoutIfNeeded()

            self.view.layoutIfNeeded()
        })
        
        
    }
    func normalConstraints() {
        UIView.animate(withDuration: 0.3, animations: {() -> Void in

            self.imgMenu.isHidden = false
            self.searchTopViewConstraint.constant = 200.0
//            self.searchView.layoutIfNeeded()
            self.view.layoutIfNeeded()
        })
    
    }


}

//MARK:- Change color of image
extension UIImageView {
    @IBInspectable
    var changeColor: UIColor? {
        get {
            let color = UIColor(cgColor: layer.borderColor!);
            return color
        }
        set {
            let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
            self.image = templateImage
            self.tintColor = newValue
        }
    }
}



//MARK:-List items for side menu
class MenuListController: UITableViewController {
    var items = ["Profile","Login", "Register","Payment","Logout"]
    var images = ["userwhiteimage","userwhiteimage","userwhiteimage","userwhiteimage","logout"]
    let darkcolor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"0E589D")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
          cell.imageView?.image = UIImage(named: images[indexPath.row])
        //MARK:- to change image tint color
        cell.imageView?.image = cell.imageView?.image?.withRenderingMode(.alwaysTemplate)
        cell.imageView?.tintColor = UIColor.white
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = cell.textLabel?.font.withSize(20)
        cell.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"0E589D")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row
        {
        case 0:
            let destinationController = ProfileViewController .instantiateViewControllerFromStoryboard(storyBoardName: "ProfileScreens")
            self.navigationController?.pushViewController(destinationController!, animated: true)
        case 1:
            let destinationController = LoginViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
            self.navigationController?.pushViewController(destinationController!, animated: true)
            
        case 2:
            let destinationController = RegistrationViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
            self.navigationController?.pushViewController(destinationController!, animated: true)
        case 3:
            let destinationController = PaymentViewController .instantiateViewControllerFromStoryboard(storyBoardName: "PaymentScreens")
            self.navigationController?.pushViewController(destinationController!, animated: true)
        case 4:
            let destinationController = OTPViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
            self.navigationController?.pushViewController(destinationController!, animated: true)
        default:
            print("ll")
        }
//
        
        
    }
}
