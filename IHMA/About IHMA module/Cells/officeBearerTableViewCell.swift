//
//  officeBearerTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 14/06/21.
//

import UIKit

class officeBearerTableViewCell: UITableViewCell {

    @IBOutlet weak var bearerView: UIView!
    @IBOutlet weak var lblBearer: UILabel!
    @IBOutlet weak var txtDesc: UITextView!
    @IBOutlet weak var bearersCollectionView: UICollectionView!
    let images = ["demo1","demo2","demo3","bill-gates-philanthropist1"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bearersCollectionView.delegate = self
        bearersCollectionView.dataSource = self
        updateUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- UI changes
        func updateUI(){
            bearerView.layer.cornerRadius = 30
            bearerView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"25A8E2")
        }

}

//MARK:- UIcollectionview delegate and datasources
extension officeBearerTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "officers", for: indexPath) as? OfficeBearersCollectionViewCell
        cell?.imgPerson.makeRounded()
        cell?.imgPerson.image = UIImage(named: images[indexPath.item])
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = CGSize(width:0 ,height:0)
        let itemPerRow = CGFloat(1)
        let availableWidth = bearersCollectionView.frame.width/4.5
        let widthPerItem = availableWidth / itemPerRow
        let availableHeight = self.bearersCollectionView.frame.height
        let heightPerItem = availableHeight

        cellSize = CGSize(width: widthPerItem, height: heightPerItem )
        return cellSize
    }
}
