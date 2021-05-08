//
//  registrationTableDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 04/05/21.
//

import UIKit

class RegistrationTableDataSource: NSObject {
    weak var parentView: RegistrationViewController?
    init(attachView: RegistrationViewController) {
        super.init()
        self.parentView = attachView
        attachView.formTableView.delegate = self
        attachView.formTableView.dataSource = self
    }
    @objc func submitBtnTapped(sender: UIButton) {
        let destinationController = OTPViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
        self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        
    }
}

//Mark:- Delegate Methods
extension RegistrationTableDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//Mark:- Datasource methods
extension RegistrationTableDataSource: UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.parentView?.fieldNames.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 10)
        {
            let cell = ((self.parentView?.formTableView.dequeueReusableCell(withIdentifier: "Button", for: indexPath))!  as? SubmitTableViewCell)!
            cell.btnSubmit.layer.cornerRadius = 30
            cell.btnSubmit.addTarget(self,action:#selector(submitBtnTapped(sender:)), for: .touchUpInside)
            return cell
        }
        else if (indexPath.row < 7){
        let cell = ((self.parentView?.formTableView.dequeueReusableCell(withIdentifier: "Registration", for: indexPath))! as? FormTableViewCell)!
        cell.lblField.text = (self.parentView?.fieldNames[indexPath.row])!
        cell.fieldTxt.text = (self.parentView?.textFieldNames[indexPath.row])!
        cell.fieldTxt.addUnderLine()
        return cell
        } else {
            let cell = ((self.parentView?.formTableView.dequeueReusableCell(withIdentifier: "dropdown", for: indexPath))!  as? DropdownTableViewCell)!
            cell.lblField.text = (self.parentView?.fieldArray[indexPath.row])!
            return cell
        }
        let cell = ((self.parentView?.formTableView.dequeueReusableCell(withIdentifier: "Registration", for: indexPath))! as? FormTableViewCell)!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
}
