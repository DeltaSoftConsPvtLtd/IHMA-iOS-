//
//  GuestRegistrationTableDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 06/08/21.
//

import UIKit

class GuestRegistrationTableDataSource: NSObject {
    
    weak var parentView: GuestRegistrationViewController?
    //Parameters for api call
    var guestName:String = ""
    var guestEmail:String = ""
    var guestMobile:Int?
    var guestRegNumber:Int?
    var guestState:String = ""
    init(attachView: GuestRegistrationViewController) {
        super.init()
        self.parentView = attachView
        attachView.guestFormTableView.delegate = self
        attachView.guestFormTableView.dataSource = self
    }
    
    @objc func submitBtnTapped(sender: UIButton) {
        if (guestName != "" && guestEmail != "" && guestMobile != nil && guestRegNumber != nil && guestState != "")
        {
            email = guestEmail
            phone = String(guestMobile!)
        let destinationController = PaymentViewController.instantiateViewControllerFromStoryboard(storyBoardName: "PaymentScreens")
        self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        } else {
            self.parentView?.showAlertView(heading: "Error", message: "Please enter all fields")
        }
    }
    
    //MARK:- to get values typed inside textfields
    @objc func textFieldDidChange(sender: UITextField) {
        switch (sender.tag) {
        case 0:
            guestName = sender.text!
        case 1:
            guestEmail = sender.text!
        case 2:
            guestMobile = Int(sender.text!)
        case 3:
            guestRegNumber = Int(sender.text!)
        case 4:
            guestState = sender.text!
        default:
            break
        }
    }
}

//Mark:- Delegate Methods
extension GuestRegistrationTableDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

//MARK:- Datasource methods
extension GuestRegistrationTableDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.parentView?.titleNames.count)! + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 5) {
            let cell = (self.parentView?.guestFormTableView.dequeueReusableCell(withIdentifier: "Button", for: indexPath))! as? GuestBtnTableViewCell
            cell?.submitBtn.layer.cornerRadius = 30
            cell?.backgroundColor = UIColor.white
            cell?.submitBtn.addTarget(self,action:#selector(submitBtnTapped(sender:)), for: .touchUpInside)
            return cell!
        } else {
        
        let cell = (self.parentView?.guestFormTableView.dequeueReusableCell(withIdentifier: "GuestFields", for: indexPath))! as? GuestFormTableViewCell
        cell?.titleLbl.text = (self.parentView?.titleNames[indexPath.row])!
        cell?.backgroundColor = UIColor.white
        if (guestName != nil && indexPath.row == 0)
        {
            cell?.TxtField.text = guestName
        }
        if (guestEmail != nil && indexPath.row == 1)
        {
            cell?.TxtField.text = guestEmail
        }
        if (guestMobile != nil && indexPath.row == 2)
        {
            cell?.TxtField.text = String(guestMobile!)
        }
        if (guestRegNumber != nil && indexPath.row == 3)
        {
            cell?.TxtField.text = String(guestRegNumber!)
        }
        if (guestState != nil && indexPath.row == 4)
        {
            cell?.TxtField.text = guestState
        }
        cell?.TxtField.tag = indexPath.row
        //MARK:- to add target to text field inside cell
        cell?.TxtField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
            
            switch  (indexPath.row) {
            case 0:
                cell?.TxtField.keyboardType = .alphabet
            case 1:
                cell?.TxtField.keyboardType = .alphabet
            case 2:
                cell?.TxtField.keyboardType = .numberPad
            case 3:
                cell?.TxtField.keyboardType = .numberPad
            case 4:
                cell?.TxtField.keyboardType = .alphabet
            default:
                break
                
            }
            
        return cell!
        }
        let cell = (self.parentView?.guestFormTableView.dequeueReusableCell(withIdentifier: "Button", for: indexPath))! as? GuestBtnTableViewCell
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
