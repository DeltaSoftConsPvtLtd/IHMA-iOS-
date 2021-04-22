//
//  DataSource.swift
//  IHMA
//
//  Created by Nikil Davis on 12/25/20.
//

import Foundation
import UIKit

class ViewDataSource: NSObject {
        
    weak var parentView: ViewController?
    var itemDidReachEnd: ((Bool) -> Void)?
    var isPageRefreshing = false
    init(attachView: ViewController) {
        super.init()
        self.parentView = attachView
        attachView.pageCollectionView.delegate = self
        attachView.pageCollectionView.dataSource = self
    }
    
    func reloadView(){
        self.parentView?.pageCollectionView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if((self.parentView?.pageCollectionView.contentOffset.y)! >= ((self.parentView?.pageCollectionView.contentSize.height)! - (self.parentView?.pageCollectionView.bounds.size.height)!)) {
                if !isPageRefreshing {
                    isPageRefreshing = true
                    itemDidReachEnd!(true)
                }
            }
      }
}

// MARK: - UICollectionView Delegate And Datasource Methods

extension ViewDataSource: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.parentView?.viewModel.movies?.count)!
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCollectionViewCell", for: indexPath as IndexPath) as! PageCollectionViewCell
        cell.content = self.parentView?.viewModel.movies?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 3.4, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
 
}

