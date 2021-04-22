//
//  ViewModel.swift
//  IHMA
//
//  Created by Nikil Davis on 12/25/20.
//

import Foundation


protocol ViewModelProtocol {
    var itemDidChanges: ((Bool, Bool) -> Void)? { get set }
    func fetchList()
}
class ViewModel: ViewModelProtocol {
 
    //MARK: - Internal Properties
    var itemDidChanges: ((Bool, Bool) -> Void)?

    var movies: [Content]? {
        didSet {
            self.itemDidChanges!(true, false)
        }
    }
    
    func fetchList() {
        Parser.shared.parserFile() { (status,msg,resp) in
            if status{
                let item = resp as! [Content]
                self.movies = item
            }
        }
    }
}
