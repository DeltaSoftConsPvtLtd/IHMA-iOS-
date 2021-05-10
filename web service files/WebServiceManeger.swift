   //
   //  WebServiceManager.swift
   //  IHMA
   //
   //  Created by Nikil Davis on 06/05/21.
   //
   
   import Foundation
       
       import UIKit
       import Alamofire
       import SwiftyJSON
       //import MBProgressHUD
       var fromCatagory123  : Bool = false

       class WebServiceManager: NSObject {
           //    var authToken = UserDefaults.standard.value(forKey: "user_auth_token") as! String
           static let sharedInstance = WebServiceManager()
           var webMethodType:ServiceMethodType = ServiceMethodType.none
           var completionHandler:WebServiceCompletionHandler?
           var showConnectivityErrorMessage:Bool = true
           var showLoadingIndicator:Bool = true
           var url:String?
           var parameters : [String : Any]?
           
           //    var hud:MBProgressHUD?
           
           var httpHeaders = [
               
               WS_Param_Key_ApiKey: WS_ApiKey,
               WS_Param_Key_ContentType: WS_ContentType
           ]
           
           //MARK:- Functions corresponding to each endpoint
           
           
           //MARK:- Restaurant
           /**
            * Restaurant Category List Web Service
            
            - parameter handler:  completion block with results
            */
           
           
           func cancelCurrentRequest()
           {
               
               let sessionManager = Alamofire.SessionManager.default
               sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
                   dataTasks.forEach { $0.cancel() }
                   uploadTasks.forEach { $0.cancel() }
                   downloadTasks.forEach { $0.cancel() }
               }
               
           }
           
           // 2 nd version release :-
       
           
           func tokenRefresh(fgHandler:WebServiceCompletionHandler?){
               
               self.webMethodType = ServiceMethodType.token
               self.completionHandler = fgHandler
               
               sendWebServiceRequest(requestJsonDict: parameters as [String : AnyObject]?, webServiceMethod: token, httpMethodType: .get, headers: nil)
            
           }
               
      
           func signInUser(username:String,password:String,fgHandler:WebServiceCompletionHandler?){
               
               self.webMethodType = ServiceMethodType.signIn
               self.completionHandler = fgHandler
               
               parameters = [ "username":username,"password":password] as [String : Any]
               sendWebServiceRequest(requestJsonDict: parameters as [String : AnyObject]?, webServiceMethod: userSignIn, httpMethodType: .post, headers: nil)
               
               
           }
           
     
        
           //    func getRadio(fgHandler:WebServiceCompletionHandler?) {
           //
           //        self.webMethodType = ServiceMethodType.radio
           //        self.completionHandler = fgHandler
           //
           //        let calendar = Calendar.current
           //        let date = calendar.date(byAdding: .hour, value: 5, to: NSDate() as Date)
           //        let finalDate = calendar.date(byAdding: .minute, value: 30, to: date!)
           //
           //
           //        let timestamp = finalDate?.timeIntervalSince1970
           //
           //        let parameters = [ "timestamp":timestamp] as [String : Any]
           //
           //
           //
//                   self.sendWebServiceRequest(requestJsonDict: parameters as [String : AnyObject]?, webServiceMethod: radioUrl, httpMethodType: .get, headers: nil)
//               }
           
           
           //MARK:- WEB SERVICE CORE FUNCTIONALITY MODULE
           
           /**
            To set up initial configurations for all web services
            
            Checks network connectivity, appends session tokens if needed
            
            
            - returns: status
            */
           
            func setUpInitialConfigurations() -> Bool {
               
               let _:NSError!
               let callService:Bool = true
               
               /* if ( self.showConnectivityErrorMessage == true ) {
                
                callService = STAppController.sharedInstance.isConnectivityAvailable()
                }
                
                if callService == false {
                
                connectivityError = NSError(domain:noInternetConnectivityError, code:noInternetConnectivityErrorCode, userInfo:nil)
                self.handleFailureResponse(connectivityError)
                
                STCommon.sharedInstance.showNoInternetConnectivityMessage()
                }
                
                if callService == true {
                
                if self.isSessionTokenNeeded() == true {
                
                httpHeaders[WS_Param_Key_SessionToken] = STWebServiceUtility.sharedInstance.getApiSessionToken()
                }
                }*/
               
               return callService
           }
           
           /**
            To determine if session token is needed
            
            - returns: status
            */
           
           func isSessionTokenNeeded() -> Bool {
               
               var needed:Bool = true
               
               switch self.webMethodType {
                   
                   //        case .Login, .ForgotPassword, .Registration:
               //            needed = false
               default:
                   needed = true
               }
               
               return needed
           }
           
           //MARK: Parsing dispatcher methods
           
           /**
            To pass valid data to appropriate response parsers. Creates error in case failure / data format mismatches
            
            - parameter data: response data
            */
           
//           func handleSuccessResponse(data:NSData?,statusCode:Int) {
//
//               //        let customError = NSError(domain:WS_Error_NoData, code: WS_ErrorCode_NoData, userInfo: nil)
//               //        self.handleFailureResponse(error: customError)
//
//               if let responseData = data {
//
//                   if let json:JSON = JSON(data:responseData as Data) {
//
//
//
//                       let responseParser:ResponseParser = ResponseParser()
//                       responseParser.parseWithResponse(json: json, serviceMethodType:self.webMethodType, completionHandler: { [weak self](status, message, responseObject, error) -> Void in
//
//                           if let ref = self {
//
//                               if let handler = ref.completionHandler {
//
//                                   print("Parsing executed  #123\(status)")
//
//                                   handler(status, message, responseObject, error)
//                               }
//                           }
//                           }, statusCode: statusCode)
//
//                   } else {
//
//                       if let handler = self.completionHandler {
//
//                           let customError = NSError(domain:WS_Error_DataFormat, code: WS_ErrorCode_DataFormat, userInfo: nil)
//                           print("Parsing not executed  #6")
//
//                           handler(false, nil, nil, customError)
//                       }
//                   }
//
//               } else {
//
//                   print("Parsing not executed  #7")
//
//                   let customError = NSError(domain:WS_Error_NoData, code: WS_ErrorCode_NoData, userInfo: nil)
//                handleFailureResponse(error: customError)
//               }
//           }
           
           //MARK: Web service failure handlers
           
           func handleFailureResponse(error:NSError) {
               
               if let handler = self.completionHandler {
                   
                   handler(false, nil, nil , error)
               }
           }
           
           /**
            Cooks and send HTTP errors according to HTTP error codes
            
            - parameter statusCode:
            */
           
           func handleErrorWithHttpStatusCode(statusCode:Int) {
               
               let error:NSError!
               
               switch statusCode
               {
               case 400:
                   error = NSError(domain:WS_HTTP_Error_BadRequest, code:WS_HTTP_ErrorCode_BadRequest, userInfo:nil)
               case 401:
                   error = NSError(domain:WS_HTTP_Error_UnAuthorizedAccess, code:WS_HTTP_ErrorCode_UnAuthorizedAccess, userInfo:nil)
               case 403:
                   error = NSError(domain:WS_HTTP_Error_Forbidden, code:WS_HTTP_ErrorCode_Forbidden, userInfo:nil)
               case 404:
                   error = NSError(domain:WS_HTTP_Error_ResourceNotFound, code:WS_HTTP_ErrorCode_ResourceNotFound, userInfo:nil)
               case 408:
                   error = NSError(domain:WS_HTTP_Error_TimeOut, code:WS_HTTP_ErrorCode_TimeOut, userInfo:nil)
               default:
                   error = NSError(domain:WS_HTTP_Error_Other, code:WS_HTTP_ErrorCode_Other, userInfo:nil)
               }
               
               if self.showConnectivityErrorMessage == true {
                   
   //                            STCommon.sharedInstance.showServerConnectivityMessage()
               }
               
               //        self.handleSuccessResponse(data: error)
           }
           
           //MARK: Core functions that do web service access
           
           /**
            Web Service request
            
            - parameter requestJsonDict: parameters
            - parameter sMethod:         web method name like Login, Logout etc...
            - parameter mType:           HTTP method type like POST, GET etc....
            */
           
           func sendWebServiceRequest(requestJsonDict:[String:AnyObject]?, webServiceMethod sMethod:String, httpMethodType mType:HttpMethod,headers:HTTPHeaders?) {
               
             var responseObj = requestJsonDict
               
               if(self.webMethodType == .advertisement)
               {
                    url = "\(baseUrl)\(sMethod)"
                   
               }
               else
               {
                   if sMethod == newVideo
                   {
                       url = "\(baseUrl)\(sMethod)"
                   }
                   else if sMethod == media_scan
                   {
                       url = "\(baseUrl)\(sMethod)"

                   }
   //                else if sMethod == userSignIn
   //                {
   //                    url = "\(demoBaseUrl)\(sMethod)"
   //
   //                }
                   else if sMethod == editorial
                   {
                       url = "\(baseUrl)\(sMethod)"
                       
                   }
                   else if sMethod == editorialdetail
                   {
                       url = "\(baseUrl)\(sMethod)"
                       
                   }
                   else if sMethod == media_scandetail
                   {
                       url = "\(baseUrl)\(sMethod)"
                       
                   }
                   else if sMethod == events
                   {
                       url = "\(baseUrl)\(sMethod)"
                       
                   }
                   else if sMethod == token
                   {
   //                    url = "\(tokenRefreshurl)"
                       url = "\(baseUrl)\(tokenRefreshurl)"

                   }
                   else if sMethod == category
                   {
   //                    url = "http://demo.webandcrafts.com/tidings/wp-json/v1/category"
   //                    responseObj = ["category_id" : 346 as AnyObject ,"langs": "es" as AnyObject]
                       if (UserDefaults.standard.value(forKey: "authToken") != nil)
                       {
                           url = "\(baseUrl)\(category)"
   //                        customCall(url: url!, parm: responseObj! , header: headers! )
                       }
                       else
                       {
                           url = "\(baseUrl)\(category)"
   //                        customCall(url: url!, parm: responseObj! , header: nil )

                       }
   //                    return
                   }
                       
                       //to select base
                   else if sMethod == prayerListUrl
                   {
                       url = "\(demoBaseUrl)\(sMethod)"
                   }
                   else if sMethod == prayerUrl
                   {
                       url = "\(demoBaseUrl)\(sMethod)"
                   }
                   else if sMethod == prayerFavouriteUrl
                   {
                      url = "\(demoBaseUrl)\(sMethod)"
                   }
                   else
                   {
                       url = "\(baseUrl)\(sMethod)"
                       
                   }
               }
               
             
   //             url = "\(baseUrl)\(sMethod)"
               
               print(mType)
               var methodType : HTTPMethod
               if mType == .post {
                   methodType = .post
               }
               else
               {
                   methodType = .get
               }
               

                           
               let queue = DispatchQueue(label: "com.test.api", qos: .background, attributes: .concurrent)
               

               Alamofire.request(url!, method: methodType, parameters: responseObj, encoding: URLEncoding.queryString, headers: headers).responseJSON(queue: queue)  { response in
                   
                   
                   print("Binu web service is being called is : ",self.url!)

   //                print("Binu web service is being called is Parameters",requestJsonDict!,self.parameters!)
                   
                   if response.response != nil
                   {
                       if let obj = response.result.value {
                           
                           print(obj)
                           
                       }
                       
                       if let statusCode = response.response?.statusCode {
                           
                           var status = 0
                           if(statusCode == WS_HTTP_CreatedCode)
                           {
                               status = WS_HTTP_SuccessCode
                           }
                           else
                           {
                               status = statusCode
                           }
                           
                           if  (status != WS_HTTP_SuccessCode) {
                               
//                               if let json:JSON = JSON(data:response.data!  as Data) {
//                                   let responseParser:ResponseParser = ResponseParser()
//
//                                   //                            responseParser.parseWithResponse(json: json, serviceMethodType:self.webMethodType, completionHandler: { [weak self](status, message, responseObject, error) -> Void in
//                                   //
//                                   //                            }, statusCode: status)
//                                   if let handler = self.completionHandler {
//
//                                       handler(false, nil, nil , nil)
//                                   }
//                               }
                               
                           }
                           else {
                               
                               switch response.result {
                                   
                               case .success:
                                print("hi")
                                   
//                                   if response.result.value != nil {
//
//                                       self.handleSuccessResponse(data: response.data as NSData?, statusCode: (response.response?.statusCode)!)
//
//                                   }
                                   
                               case .failure(let error):

                                   self.handleFailureResponse(error: error as NSError)
                                   if let handler = self.completionHandler {
                                       
                                       handler(false, nil, nil , nil)
                                   }
                               }
                           }
                       }
                       else
                       {
                           if self.showConnectivityErrorMessage == true {
                               
                               
                           }
                           
                           let error:NSError = NSError(domain:WS_Error_NoData, code:WS_ErrorCode_NoData, userInfo: nil)
                           self.handleFailureResponse(error: error)
                       }
                   }
                   else
                   {
                       if self.showConnectivityErrorMessage == true {
                           
                       }
                       
                       let error:NSError = NSError(domain:WS_Error_NoData, code:WS_ErrorCode_NoData, userInfo: nil)
                       self.handleFailureResponse(error: error)
                   }
               }
           }
           
           
           //MARK:- memory

   //        deinit {
   //            print("Web Service manager de-allocated")
   //        }
   //    }

       
//       func customCall(url : String,parm : [String : Any] , header : HTTPHeaders?)
//       {
//
//           let queue = DispatchQueue(label: "com.test.api", qos: .background, attributes: .concurrent)
//           let url2 = url//""
//
//   //        if baseUrl == "http://demo.webandcrafts.com/tidings/wp-json/"
//   //        {
//   //             url2 = "http://demo.webandcrafts.com/tidings/wp-json/v1/category"
//   //        }
//   //        else if baseUrl == "http:shalomtidings.org/wp-json/"
//   //        {
//   //            url2 = "http:shalomtidings.org/wp-json/v1/category"
//   //        }
//           self.webMethodType = ServiceMethodType.category
//
//           fromCatagory123 = true
//
//           Alamofire.request(url2, method: .get, parameters: parm, encoding: URLEncoding.queryString, headers: header).responseJSON(queue:queue)  { response in
//
//               print("Binu web service is being called is : ",self.url)
//
//               print("Binu web service is being called is Parameters")
//
//               if response.response != nil
//               {
//                   if let obj = response.result.value {
//
//                       print(obj)
//
//                   }
//
//                   if let statusCode = response.response?.statusCode {
//
//                       var status = 0
//                       if(statusCode == WS_HTTP_CreatedCode)
//                       {
//                           status = WS_HTTP_SuccessCode
//                       }
//                       else
//                       {
//                           status = statusCode
//                       }
//
//                       if  (status != WS_HTTP_SuccessCode) {
//
//                           if let json:JSON = JSON(data:response.data!  as Data) {
//                               let responseParser:ResponseParser = ResponseParser()
//
//                               //                            responseParser.parseWithResponse(json: json, serviceMethodType:self.webMethodType, completionHandler: { [weak self](status, message, responseObject, error) -> Void in
//                               //
//                               //                            }, statusCode: status)
//                               if let handler = self.completionHandler {
//
//                                   handler(false, nil, nil , nil)
//                               }
//                           }
//
//                       }
//                       else {
//
//                           switch response.result {
//
//                           case .success:
//
//                               if let obj = response.result.value {
//
//                                   self.handleSuccessResponse(data: response.data as NSData?, statusCode: (response.response?.statusCode)!)
//
//                               }
//
//                           case .failure(let error):
//
//                               self.handleFailureResponse(error: error as NSError)
//                               if let handler = self.completionHandler {
//
//                                   handler(false, nil, nil , nil)
//                               }
//                           }
//                       }
//                   }
//                   else
//                   {
//                       if self.showConnectivityErrorMessage == true {
//
//                       }
//
//                       let error:NSError = NSError(domain:WS_Error_NoData, code:WS_ErrorCode_NoData, userInfo: nil)
//                       self.handleFailureResponse(error: error)
//                   }
//               }
//               else
//               {
//                   if self.showConnectivityErrorMessage == true {
//
//                   }
//
//                   let error:NSError = NSError(domain:WS_Error_NoData, code:WS_ErrorCode_NoData, userInfo: nil)
//                   self.handleFailureResponse(error: error)
//               }
//           }
//         }
//       }
//       }

    
//    import Foundation
//
//    import UIKit
//    import Alamofire
//    import SwiftyJSON
//    //import MBProgressHUD
//    var fromCatagory123  : Bool = false
//
//    class WebServiceManager: NSObject {
//        //    var authToken = UserDefaults.standard.value(forKey: "user_auth_token") as! String
//        static let sharedInstance = WebServiceManager()
//        var webMethodType:ServiceMethodType = ServiceMethodType.none
//        var completionHandler:WebServiceCompletionHandler?
//        var showConnectivityErrorMessage:Bool = true
//        var showLoadingIndicator:Bool = true
//        var url:String?
//        var parameters : [String : Any]?
//
//        //    var hud:MBProgressHUD?
//
//        var httpHeaders = [
//
//            WS_Param_Key_ApiKey: WS_ApiKey,
//            WS_Param_Key_ContentType: WS_ContentType
//        ]
//
//
//
//        func cancelCurrentRequest()
//        {
//
//            let sessionManager = Alamofire.SessionManager.default
//            sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
//                dataTasks.forEach { $0.cancel() }
//                uploadTasks.forEach { $0.cancel() }
//                downloadTasks.forEach { $0.cancel() }
//            }
//
//        }
//
//
//        func signUpUser(first_name:String,last_name:String,username:String,email:String,password:String,fgHandler:WebServiceCompletionHandler?)
//        {
//            self.webMethodType = ServiceMethodType.signUp
//            self.completionHandler = fgHandler
//
//            parameters = [ "email":email,"username":username,"password":password] as [String : Any]
//            self.sendWebServiceRequest(requestJsonDict: parameters as [String : AnyObject]?, webServiceMethod: userSignUp, httpMethodType: .post, headers: nil)
//
//        }
//        func signInUser(username:String,password:String,fgHandler:WebServiceCompletionHandler?){
//
//            self.webMethodType = ServiceMethodType.signIn
//            self.completionHandler = fgHandler
//
//            parameters = [ "username":username,"password":password] as [String : Any]
//            self.sendWebServiceRequest(requestJsonDict: parameters as [String : AnyObject]?, webServiceMethod: userSignIn, httpMethodType: .post, headers: nil)
//
//
//        }
//
//
//
//        func forgotPassword(user_login:String,fgHandler:WebServiceCompletionHandler?)
//        {
//            self.webMethodType = ServiceMethodType.forgotPassword
//            self.completionHandler = fgHandler
//
//            parameters = [ "user_login":user_login] as [String : Any]
//            self.sendWebServiceRequest(requestJsonDict: parameters as [String : AnyObject]?, webServiceMethod: userForgotPassword, httpMethodType: .post, headers: nil)
//        }
//
//        func resetPassword(current_password:String,new_password:String,fgHandler:WebServiceCompletionHandler?)
//        {
//            self.webMethodType = ServiceMethodType.resetPassword
//            self.completionHandler = fgHandler
//            parameters = [ "current_password":current_password,"new_password":new_password] as [String : Any]
//            let authToken = UserDefaults.standard.value(forKey: "authToken") as! String
//
//            let httpHeaders = ["Authorization":"Bearer \(authToken)"]
//
//
//            self.sendWebServiceRequest(requestJsonDict: parameters as [String : AnyObject]?, webServiceMethod: userResetPassword, httpMethodType: .post, headers: httpHeaders)
//        }
//
//
//
//
//
//
//        private func setUpInitialConfigurations() -> Bool {
//
//            let _:NSError!
//            let callService:Bool = true
//
//            /* if ( self.showConnectivityErrorMessage == true ) {
//
//             callService = STAppController.sharedInstance.isConnectivityAvailable()
//             }
//
//             if callService == false {
//
//             connectivityError = NSError(domain:noInternetConnectivityError, code:noInternetConnectivityErrorCode, userInfo:nil)
//             self.handleFailureResponse(connectivityError)
//
//             STCommon.sharedInstance.showNoInternetConnectivityMessage()
//             }
//
//             if callService == true {
//
//             if self.isSessionTokenNeeded() == true {
//
//             httpHeaders[WS_Param_Key_SessionToken] = STWebServiceUtility.sharedInstance.getApiSessionToken()
//             }
//             }*/
//
//            return callService
//        }
//
//        /**
//         To determine if session token is needed
//
//         - returns: status
//         */
//
//        func isSessionTokenNeeded() -> Bool {
//
//            var needed:Bool = true
//
//            switch self.webMethodType {
//
//                //        case .Login, .ForgotPassword, .Registration:
//            //            needed = false
//            default:
//                needed = true
//            }
//
//            return needed
//        }
//
//        //MARK: Parsing dispatcher methods
//
//        /**
//         To pass valid data to appropriate response parsers. Creates error in case failure / data format mismatches
//
//         - parameter data: response data
//         */
//
//        func handleSuccessResponse(data:NSData?,statusCode:Int) {
//
//            //        let customError = NSError(domain:WS_Error_NoData, code: WS_ErrorCode_NoData, userInfo: nil)
//            //        self.handleFailureResponse(error: customError)
//
//            if let responseData = data {
//
////                if let json:JSON = JSON(data:responseData as Data) {
////
////
////
////                    let responseParser:ResponseParser = ResponseParser()
////                    responseParser.parseWithResponse(json: json, serviceMethodType:self.webMethodType, completionHandler: { [weak self](status, message, responseObject, error) -> Void in
////
////                        if let ref = self {
////
////                            if let handler = ref.completionHandler {
////
////                                print("Parsing executed  #123\(status)")
////
////                                handler(status, message, responseObject, error)
////                            }
////                        }
////                        }, statusCode: statusCode)
//////
////                } else {
////
////                    if let handler = self.completionHandler {
////
////                        let customError = NSError(domain:WS_Error_DataFormat, code: WS_ErrorCode_DataFormat, userInfo: nil)
////                        print("Parsing not executed  #6")
////
////                        handler(false, nil, nil, customError)
////                    }
////                }
//
//            } else {
//
//                print("Parsing not executed  #7")
//
//                let customError = NSError(domain:WS_Error_NoData, code: WS_ErrorCode_NoData, userInfo: nil)
//                self.handleFailureResponse(error: customError)
//            }
//        }
//
//        //MARK: Web service failure handlers
//
//        func handleFailureResponse(error:NSError) {
//
//            if let handler = self.completionHandler {
//
//                handler(false, nil, nil , error)
//            }
//        }
//
//        /**
//         Cooks and send HTTP errors according to HTTP error codes
//
//         - parameter statusCode:
//         */
//
//        func handleErrorWithHttpStatusCode(statusCode:Int) {
//
//            let error:NSError!
//
//            switch statusCode
//            {
//            case 400:
//                error = NSError(domain:WS_HTTP_Error_BadRequest, code:WS_HTTP_ErrorCode_BadRequest, userInfo:nil)
//            case 401:
//                error = NSError(domain:WS_HTTP_Error_UnAuthorizedAccess, code:WS_HTTP_ErrorCode_UnAuthorizedAccess, userInfo:nil)
//            case 403:
//                error = NSError(domain:WS_HTTP_Error_Forbidden, code:WS_HTTP_ErrorCode_Forbidden, userInfo:nil)
//            case 404:
//                error = NSError(domain:WS_HTTP_Error_ResourceNotFound, code:WS_HTTP_ErrorCode_ResourceNotFound, userInfo:nil)
//            case 408:
//                error = NSError(domain:WS_HTTP_Error_TimeOut, code:WS_HTTP_ErrorCode_TimeOut, userInfo:nil)
//            default:
//                error = NSError(domain:WS_HTTP_Error_Other, code:WS_HTTP_ErrorCode_Other, userInfo:nil)
//            }
//
//            if self.showConnectivityErrorMessage == true {
//
////                            STCommon.sharedInstance.showServerConnectivityMessage()
//            }
//
//            //        self.handleSuccessResponse(data: error)
//        }
//
//        //MARK: Core functions that do web service access
//
//        /**
//         Web Service request
//
//         - parameter requestJsonDict: parameters
//         - parameter sMethod:         web method name like Login, Logout etc...
//         - parameter mType:           HTTP method type like POST, GET etc....
//         */
//
//        func sendWebServiceRequest(requestJsonDict:[String:AnyObject]?, webServiceMethod sMethod:String, httpMethodType mType:HttpMethod,headers:HTTPHeaders?) {
//
//          var responseObj = requestJsonDict
//
//            if(self.webMethodType == .advertisement)
//            {
//                 url = "\(baseUrl)\(sMethod)"
//
//            }
//            else
//            {
//                if sMethod == newVideo
//                {
//                    url = "\(baseUrl)\(sMethod)"
//                }
//                else if sMethod == media_scan
//                {
//                    url = "\(baseUrl)\(sMethod)"
//
//                }
////                else if sMethod == userSignIn
////                {
////                    url = "\(demoBaseUrl)\(sMethod)"
////
////                }
//                else if sMethod == editorial
//                {
//                    url = "\(baseUrl)\(sMethod)"
//
//                }
//                else if sMethod == editorialdetail
//                {
//                    url = "\(baseUrl)\(sMethod)"
//
//                }
//                else if sMethod == media_scandetail
//                {
//                    url = "\(baseUrl)\(sMethod)"
//
//                }
//                else if sMethod == events
//                {
//                    url = "\(baseUrl)\(sMethod)"
//
//                }
//                else if sMethod == token
//                {
////                    url = "\(tokenRefreshurl)"
//                    url = "\(baseUrl)\(tokenRefreshurl)"
//
//                }
//                else if sMethod == category
//                {
////                    url = "http://demo.webandcrafts.com/tidings/wp-json/v1/category"
////                    responseObj = ["category_id" : 346 as AnyObject ,"langs": "es" as AnyObject]
//                    if (UserDefaults.standard.value(forKey: "authToken") != nil)
//                    {
//                        url = "\(baseUrl)\(category)"
////                        customCall(url: url!, parm: responseObj! , header: headers! )
//                    }
//                    else
//                    {
//                        url = "\(baseUrl)\(category)"
////                        customCall(url: url!, parm: responseObj! , header: nil )
//
//                    }
////                    return
//                }
//
//                    //to select base
//                else if sMethod == prayerListUrl
//                {
//                    url = "\(demoBaseUrl)\(sMethod)"
//                }
//                else if sMethod == prayerUrl
//                {
//                    url = "\(demoBaseUrl)\(sMethod)"
//                }
//                else if sMethod == prayerFavouriteUrl
//                {
//                   url = "\(demoBaseUrl)\(sMethod)"
//                }
//                else
//                {
//                    url = "\(baseUrl)\(sMethod)"
//
//                }
//            }
//
//
////             url = "\(baseUrl)\(sMethod)"
//
//            print(mType)
//            var methodType : HTTPMethod
//            if mType == .post {
//                methodType = .post
//            }
//            else
//            {
//                methodType = .get
//            }
//
//
//
//            let queue = DispatchQueue(label: "com.test.api", qos: .background, attributes: .concurrent)
//
//
//            Alamofire.request(url!, method: methodType, parameters: responseObj, encoding: URLEncoding.queryString, headers: headers).responseJSON(queue: queue)  { response in
//
//
//                print("Binu web service is being called is : ",self.url!)
//
////                print("Binu web service is being called is Parameters",requestJsonDict!,self.parameters!)
//
//                if response.response != nil
//                {
//                    if let obj = response.result.value {
//
//                        print(obj)
//
//                    }
//
//                    if let statusCode = response.response?.statusCode {
//
//                        var status = 0
//                        if(statusCode == WS_HTTP_CreatedCode)
//                        {
//                            status = WS_HTTP_SuccessCode
//                        }
//                        else
//                        {
//                            status = statusCode
//                        }
//
//                        if  (status != WS_HTTP_SuccessCode) {
//
////                            if let json:JSON = JSON(data:response.data!  as Data) {
////                                let responseParser:ResponseParser = ResponseParser()
////
////                                //                            responseParser.parseWithResponse(json: json, serviceMethodType:self.webMethodType, completionHandler: { [weak self](status, message, responseObject, error) -> Void in
////                                //
////                                //                            }, statusCode: status)
////                                if let handler = self.completionHandler {
////
////                                    handler(false, nil, nil , nil)
////                                }
////                            }
//
//                        }
//                        else {
//
//                            switch response.result {
//
//                            case .success:
//
//                                if response.result.value != nil {
//
//                                    self.handleSuccessResponse(data: response.data as NSData?, statusCode: (response.response?.statusCode)!)
//
//                                }
//
//                            case .failure(let error):
//
//                                self.handleFailureResponse(error: error as NSError)
//                                if let handler = self.completionHandler {
//
//                                    handler(false, nil, nil , nil)
//                                }
//                            }
//                        }
//                    }
//                    else
//                    {
//                        if self.showConnectivityErrorMessage == true {
//
//
//                        }
//
//                        let error:NSError = NSError(domain:WS_Error_NoData, code:WS_ErrorCode_NoData, userInfo: nil)
//                        self.handleFailureResponse(error: error)
//                    }
//                }
//                else
//                {
//                    if self.showConnectivityErrorMessage == true {
//
//                    }
//
//                    let error:NSError = NSError(domain:WS_Error_NoData, code:WS_ErrorCode_NoData, userInfo: nil)
//                    self.handleFailureResponse(error: error)
//                }
//            }
//        }
//
//
//        //MARK:- memory
//
////        deinit {
////            print("Web Service manager de-allocated")
////        }
////    }
//
//
//    func customCall(url : String,parm : [String : Any] , header : HTTPHeaders?)
//    {
//
//        let queue = DispatchQueue(label: "com.test.api", qos: .background, attributes: .concurrent)
//        let url2 = url//""
//
////        if baseUrl == "http://demo.webandcrafts.com/tidings/wp-json/"
////        {
////             url2 = "http://demo.webandcrafts.com/tidings/wp-json/v1/category"
////        }
////        else if baseUrl == "http:shalomtidings.org/wp-json/"
////        {
////            url2 = "http:shalomtidings.org/wp-json/v1/category"
////        }
//        self.webMethodType = ServiceMethodType.category
//
//        fromCatagory123 = true
//
//        Alamofire.request(url2, method: .get, parameters: parm, encoding: URLEncoding.queryString, headers: header).responseJSON(queue:queue)  { response in
//
//            print("Binu web service is being called is : ",self.url)
//
//            print("Binu web service is being called is Parameters")
//
//            if response.response != nil
//            {
//                if let obj = response.result.value {
//
//                    print(obj)
//
//                }
//
//                if let statusCode = response.response?.statusCode {
//
//                    var status = 0
//                    if(statusCode == WS_HTTP_CreatedCode)
//                    {
//                        status = WS_HTTP_SuccessCode
//                    }
//                    else
//                    {
//                        status = statusCode
//                    }
//
//                    if  (status != WS_HTTP_SuccessCode) {
//
////                        if let json:JSON = JSON(data:response.data!  as Data) {
////                            let responseParser:ResponseParser = ResponseParser()
////
////                            //                            responseParser.parseWithResponse(json: json, serviceMethodType:self.webMethodType, completionHandler: { [weak self](status, message, responseObject, error) -> Void in
////                            //
////                            //                            }, statusCode: status)
////                            if let handler = self.completionHandler {
////
////                                handler(false, nil, nil , nil)
////                            }
////                        }
//
//                    }
//                    else {
//
//                        switch response.result {
//
//                        case .success:
//
//                            if let obj = response.result.value {
//
//                                self.handleSuccessResponse(data: response.data as NSData?, statusCode: (response.response?.statusCode)!)
//
//                            }
//
//                        case .failure(let error):
//
//                            self.handleFailureResponse(error: error as NSError)
//                            if let handler = self.completionHandler {
//
//                                handler(false, nil, nil , nil)
//                            }
//                        }
//                    }
//                }
//                else
//                {
//                    if self.showConnectivityErrorMessage == true {
//
//                    }
//
//                    let error:NSError = NSError(domain:WS_Error_NoData, code:WS_ErrorCode_NoData, userInfo: nil)
//                    self.handleFailureResponse(error: error)
//                }
//            }
//            else
//            {
//                if self.showConnectivityErrorMessage == true {
//
//                }
//
//                let error:NSError = NSError(domain:WS_Error_NoData, code:WS_ErrorCode_NoData, userInfo: nil)
//                self.handleFailureResponse(error: error)
//            }
//        }
//      }
//    }
       }
