//
//  ViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 12/25/20.
//

import UIKit

class ViewController: UIViewController {
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
        initView()
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

