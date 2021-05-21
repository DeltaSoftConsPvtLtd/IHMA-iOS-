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
    var recorderTimer: Timer?
    
    override func viewDidLoad() {
        sideMenu()
        usageIndicator.isHidden = false
        usageIndicator.startAnimating()
        super.viewDidLoad()
        self.webView.configuration.processPool.perform(Selector(("_setCookieAcceptPolicy:")), with: HTTPCookie.AcceptPolicy.always)
        lbl.text = "Second Page"

        //Notification fired when screen is captured.
//        NotificationCenter.default.addObserver(self, selector: #selector(didTakeScreenshot(notification:)), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
        // Your webView code goes here

           let url = URL(string: "http://elearnihma.in/course/index.php")//http://elearnihma.in/https://www.youtube.com
           let requestObj = URLRequest(url: url! as URL)
       webView.load(requestObj)
        usageIndicator.stopAnimating()
        usageIndicator.isHidden = true
        //MARK:- Func to prevent screen recording
        recorderTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(isRecording
), userInfo: nil, repeats: true)
}
    func settings() {
//            webView.setJavaScriptEnabled(true);
//           webview.getSettings().setJavaScriptCanOpenWindowsAutomatically(true);
//           webview.getSettings().setPluginState(WebSettings.PluginState.ON);
//           webview.getSettings().setMediaPlaybackRequiresUserGesture(false);
    }

//    MARK:- Screenshot capture
    @objc func didTakeScreenshot(notification:Notification) -> Void {

       //screenshot

        }
    
    //MARK:- Screen recording
    @objc func isRecording() ->Bool {

            for screen in UIScreen.screens {

                if (screen.isCaptured) {

                    exit(0);
                    print("screen is recorded")

                    return true

                }

            }

            return false

    }


}
