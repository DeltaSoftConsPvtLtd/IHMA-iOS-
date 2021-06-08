//
//  CarouselTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 07/06/21.
//

import UIKit

class CarouselTableViewCell: UITableViewCell {

    @IBOutlet weak var carouselCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//MARK:- UIcollectionview delegate and datasources
extension CarouselTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,

                        layout collectionViewLayout: UICollectionViewLayout,

                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = CGSize(width:0 ,height:0)
        let itemPerRow = CGFloat(1)
//        let paddingSpace = sectionInsets.left * (itemPerRow + 1)
        let availableWidth = carouselCollectionView.frame.width - 20 //- paddingSpace
        let widthPerItem = availableWidth / itemPerRow
        let availableHeight = self.carouselCollectionView.frame.height - 20 //- paddingSpace
        let heightPerItem = availableHeight

        cellSize = CGSize(width: widthPerItem, height: heightPerItem )//+ (widthPerItem/2))
        return cellSize
    }
}
