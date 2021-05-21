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
    //MARK:- post parameters for registration call
    var firstName:String = ""
    var lastName:String = ""
    var regNumber:Int?
    var mobile:Int?
    var email:String = ""
    var homeAddress:String = ""
    var clinicAddress:String = ""
    var states:String = ""
    var district:String = ""
    var chapter:Int?
    var collageName:Int = 1
    var membershipFee:Int = 1
    var status = "pending_approval"
    var userType = "doctor"
    var idNo:Int = 1
    var bloodGroup = "A+ve"
    var userName = ""
    var password = ""
    init(attachView: RegistrationViewController) {
        super.init()
        self.parentView = attachView
        attachView.formTableView.delegate = self
        attachView.formTableView.dataSource = self
    }
    //MARK:- to get values typed inside textfields
    @objc func textFieldDidChange(sender: UITextField) {
        print("hi")
        if (self.parentView?.segmentedControlOutlet.selectedSegmentIndex == 0)
        {
            switch (sender.tag) {
            case 0:
                firstName = sender.text!
            case 1:
                lastName = sender.text!
            case 2:
                regNumber = Int(sender.text!)
            case 3:
                mobile = Int(sender.text!)
            case 4:
                email = sender.text!
            case 5:
                homeAddress = sender.text!
            case 6:
                userName = sender.text!
            case 7:
                password = sender.text!
                
            default:
                break
            }
        } else
        {
            //Student
        }
        
    }
    
    @objc func submitBtnTapped(sender: UIButton) {
        //MARK:- to display activity indicator
        self.parentView?.activityIndicator.isHidden = false
        self.parentView?.activityIndicator.startAnimating()
        
        if firstName.count != 0 {
            if lastName.count != 0 {
                if regNumber != 0 {
                    if mobile != 0 {
                        if email.count != 0 {
                            if homeAddress.count != 0 {
                                
                                signupApi()
                                
                            } else {
                                //home address
                            }
                            
                        } else {
                            //email
                        }
                    } else {
                            //mobile
                        
                    }
                    
                } else {
                    //registration number
                }
                
            } else {
                //lastname
            }
            
        } else {
            //firstname
        }


        
//        registrationApi()
        
    }
    func signupApi() {
        let url = "\(baseUrl)\(userSignup)"
        let post = Post_RegistrationModel(first_name: firstName, last_name: lastName, registration_number: regNumber!, phone: mobile!, address: homeAddress, state: states, districts: district, collage_name: collageName, membership_fee: membershipFee, status: status, user_type: userType, chapter: chapter!, username: userName, email: email, password: password, password2: password, id_no: idNo, blood_group: bloodGroup)
        
        ApiClient.shared.getData("POST", url, post, RegistrationModel.self) { (sucess, resp, msg) in
            
                    if sucess{
                        let response = resp as! RegistrationModel
                        print(response.status?.type!)
                        print(resp)
                        
                if (response.data![0].status! == "Authenticated") {
                    self.parentView?.activityIndicator.isHidden = true
                    
                        self.parentView?.showAlertView(heading: "Registered", message: "You have registered successfully")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            let destinationController = LoginViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Loginscreens")
                            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
                        }
                    }//if loof authentication
                        else {
                            self.parentView?.activityIndicator.isHidden = true
                            self.parentView?.showAlertView(heading: "Failed", message: "Registration process failed")
                                }//authentication else case
                    }//If success
        }//end of api call
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
        }//end of api call
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
        if (indexPath.row == 12)
        {
            let cell = ((self.parentView?.formTableView.dequeueReusableCell(withIdentifier: "Button", for: indexPath))!  as? SubmitTableViewCell)!
            cell.btnSubmit.layer.cornerRadius = 30
            cell.btnSubmit.addTarget(self,action:#selector(submitBtnTapped(sender:)), for: .touchUpInside)
            return cell
        }
        else if (indexPath.row < 9){
        let cell = ((self.parentView?.formTableView.dequeueReusableCell(withIdentifier: "Registration", for: indexPath))! as? FormTableViewCell)!
            if (self.parentView?.segmentedControlOutlet.selectedSegmentIndex == 0)
            {
                cell.lblField.text = (self.parentView?.fieldNames[indexPath.row])!
                cell.fieldTxt.text = (self.parentView?.textFieldNames[indexPath.row])!
                cell.lblValidation.text = "Please enter valid \((self.parentView?.textFieldNames[indexPath.row])!)"
                cell.lblValidation.textColor = UIColor.red
                cell.lblValidation.isHidden = true
                if (firstName != nil && indexPath.row == 0)
                {
                    cell.fieldTxt.text = firstName
                }
                if (lastName != nil && indexPath.row == 1)
                {
                    cell.fieldTxt.text = lastName
                }
                if (regNumber != nil && indexPath.row == 2)
                {
                    cell.fieldTxt.text = String(regNumber!)
                }
                if (mobile != nil && indexPath.row == 3)
                {
                    cell.fieldTxt.text = String(mobile!)
                }
                if (email != nil && indexPath.row == 4)
                {
                    cell.fieldTxt.text = email
                }
                if (homeAddress != nil && indexPath.row == 5)
                {
                    cell.fieldTxt.text = homeAddress
                }
                if (userName != nil && indexPath.row == 6)
                {
                    cell.fieldTxt.text = userName
                }
                if (password != nil && indexPath.row == 7 || indexPath.row == 8)
                {
                    cell.fieldTxt.text = password
                }
               
                cell.fieldTxt.tag = indexPath.row
                //MARK:- to add target to text field inside cell
                cell.fieldTxt.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)

            
                switch  (indexPath.row) {
                case 0:
                    cell.fieldTxt.isSecureTextEntry = false
                    cell.fieldTxt.keyboardType = .alphabet
                case 1:
                    cell.fieldTxt.isSecureTextEntry = false
                    cell.fieldTxt.keyboardType = .alphabet
                case 2:
                    cell.fieldTxt.isSecureTextEntry = false
                    cell.fieldTxt.keyboardType = .numberPad
                case 3:
                    cell.fieldTxt.isSecureTextEntry = false
                    cell.fieldTxt.keyboardType = .phonePad
                case 4:
                    cell.fieldTxt.isSecureTextEntry = false
                    cell.fieldTxt.keyboardType = .emailAddress
                case 5:
                    cell.fieldTxt.isSecureTextEntry = false
                    cell.fieldTxt.keyboardType = .alphabet
                case 6:
                    cell.fieldTxt.isSecureTextEntry = false
                    cell.fieldTxt.keyboardType = .alphabet
                case 7:
                    cell.fieldTxt.isSecureTextEntry = true
                default:
                    break
                }
            } else {
                cell.lblField.text = "Field Name"
                cell.fieldTxt.text = "Demo"
            }//End of segmented control outlet condition
        
//            cell.fieldView.addShadow(location: .bottom)
//        cell.fieldTxt.addUnderLine()
        return cell
        } else {
            let cell = ((self.parentView?.formTableView.dequeueReusableCell(withIdentifier: "dropdown", for: indexPath))!  as? DropdownTableViewCell)!
            
            //MARK:- to populate dropdown lists
            switch indexPath.row {
            case 9:
                cell.dropDown.dataSource = cell.statesArray
                cell.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    cell.lblTitle.text = cell.statesArray[index]
                    states = cell.lblTitle.text!
                    if(states != nil )
                    {
                        cell.lblTitle.text = states
                    }
                }
            case 10:
                cell.dropDown.dataSource = cell.districtsArray
                cell.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    cell.lblTitle.text = cell.districtsArray[index]
                    district = cell.lblTitle.text!
                    if(district != nil )
                    {
                        cell.lblTitle.text = district
                    }
                }
            case 11:
                cell.dropDown.dataSource = cell.chapterArray
                cell.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    cell.lblTitle.text = cell.chapterArray[index]
                    chapter = index + 1
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
