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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
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

           let url = URL(string: "http://elearnihma.in/course/index.php")//  http://elearnihma.in/https://www.youtube.comhttps://www.ihma.in/page/about-us
           let requestObj = URLRequest(url: url! as URL)
            webView.load(requestObj)
    }
//    MARK:- Screenshot capture
    @objc func didTakeScreenshot(notification:Notification) -> Void {

       //screenshot
        //MARK:- Alert
        DispatchQueue.main.async {

            let alert = UIAlertController(title: "ScreenShot Not allowed", message: "Please dont take screenshots of the app.App is closing", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                //Action for exiting the app
                exit(0);
                }
            // Add the actions
                alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        }
        
        

        }
    
    //MARK:- Screen recording
    @objc func isRecording() ->Bool {

            for screen in UIScreen.screens {

                if (screen.isCaptured) {

                    showAlertView(heading: "Recording on", message: "Screen Recording feature on. Please disable it. App is closing")
                    //MARK:- Exit app
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        exit(0);
                    }
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
extension WebViewViewController:WKNavigationDelegate
{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        progressView.isHidden = true
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        }
}


