//
//  ViewController2.swift
//  IHMA
//
//  Created by Nikil Davis on 22/04/21.
//

import Foundation
import UIKit
import WebKit


class WebViewViewController: BaseViewController {
    
    @IBOutlet weak var usageIndicator: UIActivityIndicatorView!
    

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var lbl: UILabel!
    var downloadCheckTimer = Timer()
    
    override func viewDidLoad() {
        sideMenu()
        usageIndicator.isHidden = false
        usageIndicator.startAnimating()
        super.viewDidLoad()
//        self.webView.configuration.processPool.perform(Selector(("_setCookieAcceptPolicy:")), with: HTTPCookie.AcceptPolicy.always)
        lbl.text = "Second Page"

        //Notification fired when screen is captured.
//        NotificationCenter.default.addObserver(self, selector: #selector(didTakeScreenshot(notification:)), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
        // Your webView code goes here
//        if let mediaURL:URL = URL(string: "http://elearnihma.in/") {
//            let request:URLRequest = URLRequest(url: mediaURL);
//            self.webView.load(request)
//        }
           let url = URL(string: "http://elearnihma.in/")//http://elearnihma.in/
           let requestObj = URLRequest(url: url! as URL)
       webView.load(requestObj)
        usageIndicator.stopAnimating()
        usageIndicator.isHidden = true
        //MARK:- Func to prevent screen recording
//        downloadCheckTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(isRecording()), userInfo: nil, repeats: true)
//        isRecording()
        
         }
    

//    MARK:- Screenshot capture
    @objc func didTakeScreenshot(notification:Notification) -> Void {

       //screenshot

        }
    
    //MARK:- Screen recording
    func isRecording() ->Bool {

            for screen in UIScreen.screens {

                if (screen.isCaptured) {

                    print("screen is recorded")

                    return true

                }

            }

            return false

    }


}
