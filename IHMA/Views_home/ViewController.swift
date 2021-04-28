//
//  ViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 12/25/20.
//

import UIKit

class ViewController: BaseViewController {
    let viewModel = ViewModel()
    var viewDataSource : ViewDataSource?
    @IBOutlet var titileLabel: UILabel!{
        didSet{
            titileLabel.text = "Start....."
            titileLabel.font = setFontRegular(20.0)
        }
    }
    @IBOutlet var pageCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"0E589D")
        initView()
        sideMenu()
       
    }
    
    func initView(){
        prepareViewModelObserver()
        fetchList()
    }
}

//MARK: Private Methods
extension ViewController {
    func fetchList() {
        self.viewModel.fetchList()
    }
    
    func prepareViewModelObserver() {
        self.viewModel.itemDidChanges = { (finished, error) in
            if !error {
                DispatchQueue.main.async {
                    self.viewDataSource = ViewDataSource(attachView: self)
                    self.viewDataSource!.itemDidReachEnd = { reached in
                        if reached{
                        }
                    }
                    self.viewDataSource!.reloadView()
                }
               
            }
        }
    }
}

