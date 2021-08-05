//
//  RegistrationViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 23/04/21.
//

import UIKit
import DropDown


class RegistrationViewController: BaseViewController {
    
    let dropDown = DropDown()
    let membershipArray = ["Member", "Non member"]
    let fieldNames = ["First Name", "Last Name", "Med Council", "Registration Number","Id No.", "Mobile","Email","Address Home","Username","Password","Confirm Password","","","","",""]
    let textFieldNames = ["", "", "", "","","","","","","","","","","",""]
    let fieldArray = ["","","","","","","","","","","","State", "District", "Chapter District" ,"Chapter"]
    var membershipType:String?
    var chapter:String = ""//:Int = 1
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
    
    @IBOutlet weak var membershipView: UIView!
    @IBOutlet weak var membershipLbl: UILabel!
    var registrationTableDataSource: RegistrationTableDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        pickedImage.makeRounded()
        gradientColors()
        constraintSettings()
        parsingChapterData(x: 0)
        listDown()
        
        self.registrationTableDataSource = RegistrationTableDataSource(attachView: self)
        // Do any additional setup after loading the view.
        
    }
    
    func setupUI()
    {
        //MARK:- to change text color of selected text in uisegmented Control
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white as Any], for: .selected)
        
        membershipView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"FF6C5D")
        membershipView.isHidden = false
        membershipView.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 30.0)
        formView.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
//        separatorView.dropShadow()
        TabbarView.addShadow(location: .top)
        pickedImage.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"6EBEFB")
        activityIndicator.isHidden = true
        formTableView.backgroundColor = UIColor.white
        formView.backgroundColor = UIColor.white
        
//        separatorView.addShadow(location: .bottom)
    }
    
    func listDown() {
        
        dropDown.anchorView = membershipView
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y: -(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        dropDown.dataSource = membershipArray
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.membershipLbl.text = membershipArray[index]
            membershipType = membershipArray[index]
//            self.lblTitle.text = fruitsArray[index]
        }
    }
    
    //Tap action on dropdown
    @IBAction func dropDownTap(_ sender: Any) {
        dropDown.show()
    }
    
    @IBAction func segmentedControl(_ sender: Any) {
        self.registrationTableDataSource!.userType = segmentedControlOutlet.titleForSegment(at: segmentedControlOutlet.selectedSegmentIndex)!
        formTableView.reloadData()
    }
    
    //MARK :- to populate chapter districts
    func parsingChapterData(x:Int) {
        ChapterParser.shared.parserFile(Chapters_List) { (status,msg,resp) in
            if status{
                let response = resp as! ChaptersModel
                print(response.districts![1].district)
                
                if(chapter != "" )
                {
                    chapterArray.removeAll()
                    
                    for index in 0...((response.districts![x].chapters?.count)!-1)
                    {

                        chapterArray.append(response.districts![x].chapters![index])
                    }
                    self.formTableView.reloadData()
                } else {
                    chapterDistrictArray.removeAll()
                for index in 0...((response.districts?.count)!-1)
                {
                    if  ( (response.districts![index].district) != nil)
                    
                    {
                        chapterDistrictArray.append((response.districts![index].district)!)
                    }
                }
                }//Else
            }//End of if loop for status
        }//End of parser
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



