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

    @IBOutlet weak var ttileTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var aboutTableView: UITableView!
    
    //MARK:- Header view outlets
    @IBOutlet weak var tableViewHeader: UIView!
    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var lblAbout: UILabel!
    @IBOutlet weak var lblIHMA: UILabel!
    @IBOutlet weak var txtDescription: UITextView!
    
    
    var  aboutTableDataSource: AboutTableDataSource?
    let titles = ["Chapters", "Office Bearers"]
    
    override func viewDidLoad() {
        
        self.aboutTableDataSource = AboutTableDataSource(attachView: self)
        
        webView.navigationDelegate = self
        super.viewDidLoad()
        gradientTwoColors()
//        view.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"1575CE")
        preventScreen()
        setupUI()
        loadWebView()
        sideMenu()
        constraintSettings()
      
       
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
    
    func constraintSettings() {
        if UIScreen.main.bounds.height < 850
        {
            ttileTopConstraint.constant = 10
        }
        else{
            ttileTopConstraint.constant = 40
        }
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
