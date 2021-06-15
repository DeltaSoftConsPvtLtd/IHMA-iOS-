//
//  ActivitiesTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 09/06/21.
//

import UIKit



class ActivitiesTableViewCell: UITableViewCell {
//    func menuReady() {
//        print("hi")
//    }
    

    @IBOutlet weak var activitiesCollectionView: UICollectionView!


    var images = ["courses-1","training","conference","events","courses-1","training","conference","events"]
    var titles = ["Articles","Trainings","Flash News","Events","Articles","Trainings","Flash News","Events"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        activitiesCollectionView.delegate = self
        activitiesCollectionView.dataSource = self
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func activityBtnTapped(sender:UIButton)
    {
        switch (sender.tag) {
        case 0:
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: ActivitiesViewController) as! ActivitiesViewController
//                self.present(vc, animated: true, completion: nil)
//            let destinationController = ActivitiesViewController .instantiateViewControllerFromStoryboard(storyBoardName: "Main")
//            self.navigationController?.pushViewController(destinationController!, animated: true)
//            self.delegate.menuReady()
            print("publications")
        case 1:
            print("Trainings")
        case 2:
            print("Conferences")
        case 3:
            print("event")
        case 4:
            print("New")
        case 5:
            print("demo")
        case 6:
            print("struct")
        case 7:
            print("event")
        default:
            break
        }
    }
    
}

//MARK:- UIcollectionview delegate and datasources
extension ActivitiesTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Research", for: indexPath) as? ActivitiesCollectionViewCell
        cell?.backgroundColor = UIColor.clear
        cell?.imgActivity.image =  UIImage(named: images[indexPath.row])
        cell?.viewActivity.layer.cornerRadius = (cell?.viewActivity.frame.width)! / 2
        if UIScreen.main.bounds.width < 400
        {
            cell?.lblActivity.font =  cell?.lblActivity.font.withSize(15)
        } else {
            
            cell?.lblActivity.font =  cell?.lblActivity.font.withSize(17)
        }
        cell?.lblActivity.text = titles[indexPath.row]
        cell!.btnActivity.tag = indexPath.row
        cell!.btnActivity.addTarget(self, action: #selector(activityBtnTapped(sender:)),
                                    for: UIControl.Event.touchUpInside)
//        cell!.delegate = self

       
       

        return cell!
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = CGSize(width:0 ,height:0)
        let itemPerRow = CGFloat(1)
        let availableWidth = activitiesCollectionView.frame.width/4.5
        let widthPerItem = availableWidth / itemPerRow
        let availableHeight = self.activitiesCollectionView.frame.height/2 - 20
        let heightPerItem = availableHeight

        cellSize = CGSize(width: widthPerItem, height: heightPerItem )
        return cellSize
    }
}
