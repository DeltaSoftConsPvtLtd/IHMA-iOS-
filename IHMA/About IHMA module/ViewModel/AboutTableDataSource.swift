//
//  AboutTableDataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 14/06/21.
//

import UIKit

class AboutTableDataSource: NSObject,NavDelegate {
    
    weak var parentView: AboutUsViewController?
    
    init(attachView: AboutUsViewController) {
        super.init()
        self.parentView = attachView
        attachView.aboutTableView.delegate = self
        attachView.aboutTableView.dataSource = self
    }
    
    //MARK :- Delegate func called from collection view cell using another delegate
    
    func clickEvent(tag: Int) {
   
        switch (tag) {
        case 0:
            let destinationController = ContactUsViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ContactUsViewController
            destinationController!.image = "Dr. ganesh"
            destinationController!.name = "DR GANESH DAS"
            destinationController!.contactTitle = "DESIGNATION"
            destinationController!.positionName = "State President"
            destinationController!.address = "Pallichambel Road, Samskara junction, Palarivattom, Ernakulam 682 025"
            destinationController!.phone = "(+91) 9895 536 036"
            destinationController!.email = "drganeshgdas@gmail.com"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        case 1:
            let destinationController = ContactUsViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ContactUsViewController
            destinationController!.image = "Dr. Anwar"
            destinationController!.name = "DR ANWAR RAHMAN T.K"
            destinationController!.contactTitle = "DESIGNATION"
            destinationController!.positionName = "General Secretary"
            destinationController!.address = "1/4741, Eranjipalam P.O., Kozhikode - 673 006, Kerala"
            destinationController!.phone = "(+91) 944 412 6169"
            destinationController!.email = "info@ihma.in"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        case 2:
            let destinationController = ContactUsViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ContactUsViewController
            destinationController!.image = "Dr. Jibil"
            destinationController!.name = "DR. JIBIL"
            destinationController!.contactTitle = "DESIGNATION"
            destinationController!.positionName = "Secretary"
            destinationController!.address = "Pookkottil House,Nallalam P.O., Kozhikode - 673 027, Kerala"
            destinationController!.phone = "(+91) 808 993 0450"
            destinationController!.email = "jibil.p@gmail.com"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        case 3:
            let destinationController = ContactUsViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ContactUsViewController
            destinationController!.image = "Dr. Deepu"
            destinationController!.name = "DR. DEEPU DEV"
            destinationController!.contactTitle = "DESIGNATION"
            destinationController!.positionName = "Secretary"
            destinationController!.address = "Padmaragam, Zacharia Bazar, Alappuzha - 688 012, Kerala"
            destinationController!.phone = "(+91) 984 603 6943"
            destinationController!.email = "deepudev@gmail.com"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        case 4:
            let destinationController = ContactUsViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ContactUsViewController
            destinationController!.image = "ashok kumar"
            destinationController!.name = "DR. S N. ASOKKUMAR"
            destinationController!.contactTitle = "DESIGNATION"
            destinationController!.positionName = "Vice President"
            destinationController!.address = "Tharakanparambil,Arakulam P.O, Idukki - 685 591, Kerala"
            destinationController!.phone = "(+91) 944 760 9510"
            destinationController!.email = "snasok3@gmail.com"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        case 5:
            let destinationController = ContactUsViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ContactUsViewController
            destinationController!.image = "shameem"
            destinationController!.name = "DR. MOHAMMED SHAMEEM V"
            destinationController!.contactTitle = "DESIGNATION"
            destinationController!.positionName = "Vice President"
            destinationController!.address = "Varikkodan House,Chemmaniyod P.O, Malappuram - 679 325, Kerala"
            destinationController!.phone = "(+91) 989 544 8906"
            destinationController!.email = "drshameem2012@gmail.com"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        case 6:
            let destinationController = ContactUsViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main") as? ContactUsViewController
            destinationController!.image = "biju"
            destinationController!.name = "DR. BIJU A"
            destinationController!.contactTitle = "DESIGNATION"
            destinationController!.positionName = "Treasurer"
            destinationController!.address = "Pulickal, Kavanad P O, Kollam - 691 003, Kerala"
            destinationController!.phone = "(+91) 944 642 0917"
            destinationController!.email = "drbijua@yahoo.com"
            self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
        default:
            break
        }
      
    }
    
  
    
    @objc func seemoreBtnTapped(sender:UIButton) {
        print("tapped")
        chapterDistrictArray.removeAll()
        let destinationController = ChaptersViewController.instantiateViewControllerFromStoryboard(storyBoardName: "ChapterScreens")
        self.parentView?.navigationController?.pushViewController(destinationController!, animated: true)
    }
}

//Mark:- Delegate Methods
extension AboutTableDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//Mark:- Datasource methods
extension AboutTableDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.parentView?.titles.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            let cell = (self.parentView?.aboutTableView.dequeueReusableCell(withIdentifier: "bearer", for: indexPath))! as? officeBearerTableViewCell
            cell?.bearerView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"2CBFD8")
            cell?.lblBearer?.text = "Office Bearers"
            cell!.navDelegate = self
            return cell!
        } else {
            let cell = (self.parentView?.aboutTableView.dequeueReusableCell(withIdentifier: "about", for: indexPath))! as? ChapterTableViewCell
            cell?.lblTitle?.text = "Chapters"
            cell?.btnSeeMore.layer.cornerRadius = (cell?.btnSeeMore.frame.size.height)!/2 // this value vary as per your desire
            cell?.chapterView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"2CC2D7")
            cell!.btnSeeMore.addTarget(self, action: #selector(seemoreBtnTapped(sender:)),
                                        for: UIControl.Event.touchUpInside)
            return cell!
        }
        let cell = (self.parentView?.aboutTableView.dequeueReusableCell(withIdentifier: "about", for: indexPath))! as? ChapterTableViewCell
      
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 250
        }
        return 175
    }
}
