//
//  ViewController2.swift
//  IHMA
//
//  Created by Nikil Davis on 22/04/21.
//

import Foundation
import UIKit
import WebKit


class ViewController2: BaseViewController {
    
    @IBOutlet weak var usageIndicator: UIActivityIndicatorView!
    

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        sideMenu()
        usageIndicator.isHidden = false
        usageIndicator.startAnimating()
        super.viewDidLoad()
        lbl.text = "Second Page"
        
        // Your webView code goes here
           let url = URL(string: "https://www.google.com")
           let requestObj = URLRequest(url: url! as URL)
       webView.load(requestObj)
        usageIndicator.stopAnimating()
        usageIndicator.isHidden = true
        
         }

}
