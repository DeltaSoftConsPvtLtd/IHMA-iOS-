//
//  ViewController2.swift
//  IHMA
//
//  Created by Nikil Davis on 22/04/21.
//

import Foundation
import UIKit
import WebKit


class WebViewViewController: BaseViewController{
    
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var lbl: UILabel!
    var recorderTimer: Timer?
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        webView.navigationDelegate = self
        super.viewDidLoad()
        preventScreen()
        setupUI()
        loadWebView()
       
    }
    
   //MARK:- to set up UI
    func setupUI() {
        lbl.text = "Second Page"
        progressView.setProgress(1000.02, animated: true)
        progressView.isHidden = false
    }
    
   //MARK:- Func to call to prevent screen recording and screenshots
    func preventScreen() {
        //Notification fired when screen is captured.
        NotificationCenter.default.addObserver(self, selector: #selector(didTakeScreenshot(notification:)), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
        //MARK:- Func to prevent screen recording
        recorderTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(isRecording
), userInfo: nil, repeats: true)
    }
    
    func loadWebView() {
        self.webView.configuration.processPool.perform(Selector(("_setCookieAcceptPolicy:")), with: HTTPCookie.AcceptPolicy.always)
        // Your webView code goes here

           let url = URL(string: "http://elearnihma.in/course/index.php")//http://elearnihma.in/https://www.youtube.com
           let requestObj = URLRequest(url: url! as URL)
            webView.load(requestObj)
    }
//    MARK:- Screenshot capture
    @objc func didTakeScreenshot(notification:Notification) -> Void {

       //screenshot
        exit(0);

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

//MARK:- Delegate functions of webview
extension WebViewViewController:WKNavigationDelegate
{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.isHidden = true
        }
}


