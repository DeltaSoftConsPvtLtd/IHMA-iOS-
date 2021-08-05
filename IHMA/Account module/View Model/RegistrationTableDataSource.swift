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
    var medCouncil:String = ""
    var regNumber:Int?
    var mobile:Int?
    var email:String = ""
    var homeAddress:String = ""
    var clinicAddress:String = ""
    var states:String = ""
    var district:String = "Thrissur"    
    var collageName:Int = 1
    var membershipFee:Int = 1
    var status = "pending_approval"
    var userType = "student"
    var idNo:String?
    var bloodGroup = "O+ve"
    var userName = ""
    var password = ""
    var password2 = ""
    init(attachView: RegistrationViewController) {
        super.init()
        self.parentView = attachView
        attachView.formTableView.delegate = self
        attachView.formTableView.dataSource = self
        parsingData(x: 0)
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
                medCouncil = sender.text!
            case 3:
                regNumber = Int(sender.text!)
            case 4:
                idNo = sender.text!
            case 5:
                mobile = Int(sender.text!)
            case 6:
                email = sender.text!
            case 7:
                homeAddress = sender.text!
            case 8:
                userName = sender.text!
            case 9:
                password = sender.text!
                
            case 10:
                password2 = sender.text!
                
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
        
        if (firstName != nil && lastName != nil && medCouncil != nil && regNumber != nil && mobile != nil && email != nil && userName != nil  && idNo != nil && states != nil && district != nil && homeAddress != nil && self.parentView?.membershipType != nil)  {
            
            if (password == password2) {
                                signupApi()
                                        } else {
                                                self.parentView?.showAlertView(heading: "Passwords not Matching", message: "Please enter same passwords")
                                            self.parentView?.activityIndicator.isHidden = true
                                            self.parentView?.activityIndicator.stopAnimating()
                                                }
        } else {
            self.parentView?.showAlertView(heading: "Fields not Entered", message: "Please enter all fields to register")
            self.parentView?.activityIndicator.isHidden = true
            self.parentView?.activityIndicator.stopAnimating()
            
        }
    
//        registrationApi()
        
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
                    self.parentView?.formTableView.reloadData()
                } else {
                    for index in 0...((response.states?.count)!-1)
                    {
                        statesArray.append((response.states![index].state)!)
                    }
                }
                

            }//End of if loop for status
        }//End of parser
    }
    
    
    func signupApi() {
        let url = "\(baseUrl)\(userSignup)"
        let post = Post_RegistrationModel(first_name: firstName, last_name: lastName, registration_number: regNumber!, phone: mobile!, address: homeAddress, state: states, districts: district, collage_name: collageName, membership_fee: membershipFee, status: status, user_type: userType, chapter: 2, username: userName, email: email, password: password, password2: password, id_no: 23, blood_group: bloodGroup)
        
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
                            self.parentView?.showAlertView(heading: "Failed", message: "Registration process failed \(response.data![0].details!.error!)")
                                }//authentication else case
                    }//If success
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
        if (indexPath.row == 15)
        {
            let cell = ((self.parentView?.formTableView.dequeueReusableCell(withIdentifier: "Button", for: indexPath))!  as? SubmitTableViewCell)!
            cell.btnSubmit.layer.cornerRadius = 30
            cell.backgroundColor = UIColor.white
            cell.btnSubmit.addTarget(self,action:#selector(submitBtnTapped(sender:)), for: .touchUpInside)
            return cell
        }
        else if (indexPath.row < 11){
        let cell = ((self.parentView?.formTableView.dequeueReusableCell(withIdentifier: "Registration", for: indexPath))! as? FormTableViewCell)!
//            if (self.parentView?.segmentedControlOutlet.selectedSegmentIndex == 0)
//            {
                cell.lblField.text = (self.parentView?.fieldNames[indexPath.row])!
                cell.fieldTxt.text = (self.parentView?.textFieldNames[indexPath.row])!
                cell.lblValidation.text = "Please enter valid \((self.parentView?.textFieldNames[indexPath.row])!)"
                cell.lblValidation.textColor = UIColor.red
                cell.lblValidation.isHidden = true
                cell.backgroundColor = UIColor.white
                if (firstName != nil && indexPath.row == 0)
                {
                    cell.fieldTxt.text = firstName
                }
                if (lastName != nil && indexPath.row == 1)
                {
                    cell.fieldTxt.text = lastName
                }
                if (medCouncil != nil && indexPath.row == 2)
                {
                    cell.fieldTxt.text = medCouncil
                }
                if (regNumber != nil && indexPath.row == 3)
                {
                    cell.fieldTxt.text = String(regNumber!)
                }
                if (idNo != nil && indexPath.row == 4) {
                    cell.fieldTxt.text = String(idNo!)
                }
                if (mobile != nil && indexPath.row == 5)
                {
                    cell.fieldTxt.text = String(mobile!)
                }
                if (email != nil && indexPath.row == 6)
                {
                    cell.fieldTxt.text = email
                }
                if (homeAddress != nil && indexPath.row == 7)
                {
                    cell.fieldTxt.text = homeAddress
                }
                if (userName != nil && indexPath.row == 8)
                {
                    cell.fieldTxt.text = userName
                }
                if (password != "" && indexPath.row == 9)
                {
                    cell.fieldTxt.text = password
                }
                if (password2 != "" && indexPath.row == 10)
                {
                    cell.fieldTxt.text = password2
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
                    cell.fieldTxt.keyboardType = .alphabet
                case 3:
                    cell.fieldTxt.isSecureTextEntry = false
                    cell.fieldTxt.keyboardType = .numberPad
                case 4:
                    cell.fieldTxt.isSecureTextEntry = false
                    cell.fieldTxt.keyboardType = .alphabet
                case 5:
                    cell.fieldTxt.isSecureTextEntry = false
                    cell.fieldTxt.keyboardType = .phonePad
                case 6:
                    cell.fieldTxt.isSecureTextEntry = false
                    cell.fieldTxt.keyboardType = .emailAddress
                case 7:
                    cell.fieldTxt.isSecureTextEntry = false
                    cell.fieldTxt.keyboardType = .alphabet
                case 8:
                    cell.fieldTxt.isSecureTextEntry = false
                    cell.fieldTxt.keyboardType = .alphabet
                case 9:
                    cell.fieldTxt.isSecureTextEntry = true
                    cell.fieldTxt.keyboardType = .alphabet
                case 10:
                    cell.fieldTxt.isSecureTextEntry = true
                    cell.fieldTxt.keyboardType = .alphabet
                    
                default:
                    break
                }
//            } else {
//                cell.lblField.text = "Field Name"
//                cell.fieldTxt.text = "Demo"
//            }//End of segmented control outlet condition
        
//            cell.fieldView.addShadow(location: .bottom)
//        cell.fieldTxt.addUnderLine()
        return cell
        } else {
            let cell = ((self.parentView?.formTableView.dequeueReusableCell(withIdentifier: "dropdown", for: indexPath))!  as? DropdownTableViewCell)!
            cell.backgroundColor = UIColor.white
            //MARK:- to populate dropdown lists
            switch indexPath.row {
            case 11:
                cell.dropDown.dataSource = statesArray
                cell.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    cell.lblTitle.text = statesArray[index]
                    states = cell.lblTitle.text!
                    parsingData(x: index)
                    if(states != nil )
                    {
                        cell.lblTitle.text = states
                    }
                }
            case 12:
                cell.dropDown.dataSource = districtsArray
                cell.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    cell.lblTitle.text = districtsArray[index]
                    district = cell.lblTitle.text!
                    if(district != nil )
                    {
                        cell.lblTitle.text = district
                    }
                }
            case 13:
                cell.dropDown.dataSource = chapterDistrictArray
                cell.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    cell.lblTitle.text = chapterDistrictArray[index]
                    self.parentView?.chapter = cell.lblTitle.text!
                    self.parentView?.parsingChapterData(x: index)
//                    chapter = chapterid[index]
                }
            case 14:
                    cell.dropDown.dataSource = chapterArray
                    cell.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                      print("Selected item: \(item) at index: \(index)")
                        cell.lblTitle.text = chapterArray[index]
//                        chapter = chapterid[index]
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

//Changes made
/*idno changed from integer to string. Passed default value. In api passing parameter type has to be changed. Also chapter parameter passing made default value. Chapter district and corresponding chapter dropdown added. Segment control made invisible and membershiptype dropdown added instead*/
