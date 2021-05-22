//
//  RegistrationViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 23/04/21.
//

import UIKit


class RegistrationViewController: BaseViewController {
    
 
    let fieldNames = ["First Name", "Last Name", "Registration Number", "Mobile","Email","Address Home","Username","Password","Confirm Password","","","",""]
    let textFieldNames = ["", "", "", "","","","","","","","","",""]
    let fieldArray = ["","","","","","","","","","State", "District", "Chapter"]
    @IBOutlet weak var tabbarHeightConstraint: NSLayoutConstraint!
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var pickedImage: UIImageView!
    @IBOutlet weak var registrationView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var cameraImage: UIImageView!
    @IBOutlet weak var formTableView: UITableView!
    
    var registrationTableDataSource: RegistrationTableDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        pickedImage.makeRounded()
        gradientColors()
        constraintSettings()
        
        self.registrationTableDataSource = RegistrationTableDataSource(attachView: self)
        // Do any additional setup after loading the view.
        
    }
    
    func setupUI()
    {
        //MARK:- to change text color of selected text in uisegmented Control
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white as Any], for: .selected)
        
        
        formView.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
//        separatorView.dropShadow()
        TabbarView.addShadow(location: .top)
        pickedImage.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"6EBEFB")
        activityIndicator.isHidden = true
        
//        separatorView.addShadow(location: .bottom)
    }
    
    
    @IBAction func segmentedControl(_ sender: Any) {
        self.registrationTableDataSource!.userType = segmentedControlOutlet.titleForSegment(at: segmentedControlOutlet.selectedSegmentIndex)!
        formTableView.reloadData()
    }
    //MARK:- Screen size changes
    func constraintSettings() {
        
       if UIScreen.main.bounds.height < 850 {
        tabbarHeightConstraint.constant = 60
       } else {
        tabbarHeightConstraint.constant = 80
       }
        
    }
}
    
  
    


//MARK:- Actions and delegates for image picker
extension RegistrationViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    
    //MARK:- button action for image picker function
    @IBAction func imagePicker(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
        pickedImage.image = image
            cameraImage.isHidden = true
    }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}



