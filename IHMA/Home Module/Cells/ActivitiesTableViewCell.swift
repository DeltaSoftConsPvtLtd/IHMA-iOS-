//
//  ActivitiesTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 09/06/21.
//

import UIKit

protocol ExampleCellDelegate: class {
    func demo(index:Int)
}

protocol NavigationDelegate: class {
    func nextPage(tag:Int)
}


class ActivitiesTableViewCell: UITableViewCell,ExampleCellDelegate {
    func demo(index: Int) {
        //MARK:- 2nd delegate firing .Call transferred from collection view cell to view controller
        navigationDelegate?.nextPage(tag:index)
    }
    
    weak var cellDelegate: ExampleCellDelegate?
    weak var navigationDelegate: NavigationDelegate?

    


    @IBOutlet weak var activitiesCollectionView: UICollectionView!


    var images = ["courses-1","training","conference","events","courses-1","training","conference","events"]
    var titles = ["Articles","Trainings","Flash News","Events","Articles","Trainings","Flash News","Events"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        activitiesCollectionView.delegate = self
        activitiesCollectionView.dataSource = self
        cellDelegate = self
        
     
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func activityBtnTapped(sender:UIButton)
    {
        //delegate to fire from collection view cell to table view cell
        cellDelegate?.demo(index: sender.tag)
//        switch (sender.tag) {
//        case 0:
//            //delegate to fire from collection view cell to table view cell
//            cellDelegate?.demo(index: sender.tag)
//            print("publications")
//        case 1:
//            //delegate to fire from collection view cell to table view cell
//            cellDelegate?.demo(index: sender.tag)
//            print("Trainings")
//        case 2:
//            //delegate to fire from collection view cell to table view cell
//            cellDelegate?.demo(index: sender.tag)
//            print("Conferences")
//        case 3:
//            //delegate to fire from collection view cell to table view cell
//            cellDelegate?.demo(index: sender.tag)
//            print("event")
//        case 4:
//            //delegate to fire from collection view cell to table view cell
//            cellDelegate?.demo(index: sender.tag)
//            print("New")
//        case 5:
//            //delegate to fire from collection view cell to table view cell
//            cellDelegate?.demo(index: sender.tag)
//            print("demo")
//        case 6:
//            //delegate to fire from collection view cell to table view cell
//            cellDelegate?.demo(index: sender.tag)
//            print("struct")
//        case 7:
//            print("event")
//        default:
//            break
//        }
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
