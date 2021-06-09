//
//  ActivitiesTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 09/06/21.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var activitiesCollectionView: UICollectionView!
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

}

//MARK:- UIcollectionview delegate and datasources
extension ActivitiesTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Research", for: indexPath) as? ActivitiesCollectionViewCell
        cell?.backgroundColor = UIColor.clear
//        cell?.imagesOutlet.masksToBounds = true
        return cell!
    }
}
