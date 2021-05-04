//
//  RegistrationViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 23/04/21.
//

import UIKit


class RegistrationViewController: BaseViewController {
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var pickedImage: UIImageView!
    
    @IBOutlet var registrationView: UIView!
//    let colors = Colors()
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenu()
        pickedImage.makeRounded()
        gradientColors()
        // Do any additional setup after loading the view.
        
    }
    

//      func refresh() {
//        view.backgroundColor = UIColor.clear
//        let backgroundLayer = colors.gl
//        backgroundLayer!.frame = view.frame
//        view.layer.insertSublayer(backgroundLayer!, at: 0)
//          }
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
    }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}



