//
//  registrationTableDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 04/05/21.
//

import Foundation
import UIKit

class RegistrationTableDataSource: NSObject {
    weak var parentView: RegistrationViewController?
    var firstName:String = ""
    var lastName:String = ""
    init(attachView: RegistrationViewController) {
        super.init()
        self.parentView = attachView
        attachView.formTableView.delegate = self
        attachView.formTableView.dataSource = self
    }
    //MARK:- to get values typed inside textfields
    @objc func textFieldDidChange(sender: UITextField) {
        print("hi")
        switch (sender.tag) {
        case 0:
            firstName = sender.text!
        case 1:
            lastName = sender.text!
        default:
            break
        }
        
        print(firstName)
        print(lastName)
    }
    
    @objc func submitBtnTapped(sender: UIButton) {
        registrationApi()
        let destinationController = OTPViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
        self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
    }
    
    func registrationApi () {
        let url = "\(baseUrl)\(userSignup)"
        let post = Param_Model()
        ApiClient.shared.getData("GET", url, post, RegistrationModel.self) { (sucess, resp, msg) in
                    if sucess{
                        let response = resp as! RegistrationModel
                        print(response.status?.type!)
                        print(resp)
                    }
        }
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
            cell.fieldTxt.tag = indexPath.row
            //MARK:- to add target to text field inside cell
            cell.fieldTxt.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)

            
            switch  (indexPath.row) {
            case 0:
                cell.fieldTxt.keyboardType = .alphabet
            case 1:
                cell.fieldTxt.keyboardType = .alphabet
            case 2:
                cell.fieldTxt.keyboardType = .numberPad
            case 3:
                cell.fieldTxt.keyboardType = .phonePad
            case 4:
                cell.fieldTxt.keyboardType = .emailAddress
            case 5:
                cell.fieldTxt.keyboardType = .alphabet
            case 6:
                cell.fieldTxt.keyboardType = .alphabet
            default:
                break
            }
        
//            cell.fieldView.addShadow(location: .bottom)
//        cell.fieldTxt.addUnderLine()
        return cell
        } else {
            let cell = ((self.parentView?.formTableView.dequeueReusableCell(withIdentifier: "dropdown", for: indexPath))!  as? DropdownTableViewCell)!
            
            //MARK:- to populate dropdown lists
            switch indexPath.row {
            case 7:
                cell.dropDown.dataSource = cell.statesArray
                cell.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    cell.lblTitle.text = cell.statesArray[index]
                }
            case 8:
                cell.dropDown.dataSource = cell.districtsArray
                cell.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    cell.lblTitle.text = cell.districtsArray[index]
                }
            case 9:
                cell.dropDown.dataSource = cell.chapterArray
                cell.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    cell.lblTitle.text = cell.chapterArray[index]
                }
            default:
                cell.dropDown.dataSource = cell.districtsArray
            }
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
