//
//  AboutUsViewController.swift
//  IHMA
//
//  Created by Nikil Davis on 21/05/21.
//

import UIKit
import WebKit

class AboutUsViewController: BaseViewController {

 
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    var recorderTimer: Timer?

  
    
    override func viewDidLoad() {
        webView.navigationDelegate = self
        super.viewDidLoad()
        preventScreen()
        setupUI()
        loadWebView()
       
    }
    
   //MARK:- to set up UI
    func setupUI() {
        
//        progressView.setProgress(1000.02, animated: true)
//        progressView.isHidden = false
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        self.webView!.isOpaque = false
        self.webView!.backgroundColor = UIColor.clear
        self.webView!.scrollView.backgroundColor = UIColor.clear
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

           let url = URL(string: "https://www.ihma.in/page/about-us")//  http://elearnihma.in/https://www.youtube.comhttps://www.ihma.in/page/about-us
           let requestObj = URLRequest(url: url! as URL)
            webView.load(requestObj)
    }
//    MARK:- Screenshot capture
    @objc func didTakeScreenshot(notification:Notification) -> Void {

       //screenshot
        //MARK:- Alert
        showAlertView(heading: "ScreenShot Not allowed", message: "Please dont take screenshots of the app.")

        
        

        }
    
    //MARK:- Screen recording
    @objc func isRecording() ->Bool {

            for screen in UIScreen.screens {

                if (screen.isCaptured) {

                    showAlertView(heading: "Recording on", message: "Screen Recording feature on. Please disable it.")
                  
                    print("screen is recorded")

                    return true

                }

            }

            return false

    }
//    let isCaptured = UIScreen.main.isCaptured
//
//    if isCaptured {
//        blockView.hidden = false
//    } else {
//        blockView.hidden = true
//    }
}//End of class

//MARK:- Delegate functions of webview
extension AboutUsViewController:WKNavigationDelegate
{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        progressView.isHidden = true
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        }
}
