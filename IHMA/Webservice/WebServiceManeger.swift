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
           
           
           func cancelCurrentRequest()
           {
               
               let sessionManager = Alamofire.SessionManager.default
               sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
                   dataTasks.forEach { $0.cancel() }
                   uploadTasks.forEach { $0.cancel() }
                   downloadTasks.forEach { $0.cancel() }
               }
               
           }
           
               
      
           func signInUser(username:String,password:String,fgHandler:WebServiceCompletionHandler?){
               
               self.webMethodType = ServiceMethodType.signIn
               self.completionHandler = fgHandler

            parameters = [ "username":username,"password":password] as [String : Any]

               sendWebServiceRequest(requestJsonDict: parameters as [String : AnyObject]?, webServiceMethod: userSignIn, httpMethodType: .post, headers: nil)
               
               
           }
           
        //MARK:- Web service success handlers
//        func handleSuccessResponse(data:NSData?,statusCode:Int) {
//            
//            //        let customError = NSError(domain:WS_Error_NoData, code: WS_ErrorCode_NoData, userInfo: nil)
//            //        self.handleFailureResponse(error: customError)
//            
//            if let responseData = data {
//                
//                if let json:JSON = JSON(data:responseData as Data) {
//                    
//                    
//                    
//                    let responseParser:ResponseParser = ResponseParser()
//                    responseParser.parseWithResponse(json: json, serviceMethodType:self.webMethodType, completionHandler: { [weak self](status, message, responseObject, error) -> Void in
//                        
//                        if let ref = self {
//                            
//                            if let handler = ref.completionHandler {
//                                
//                                print("Parsing executed  #123\(status)")
//                                
//                                handler(status, message, responseObject, error)
//                            }
//                        }
//                        }, statusCode: statusCode)
//                    
//                } else {
//                    
//                    if let handler = self.completionHandler {
//                        
//                        let customError = NSError(domain:WS_Error_DataFormat, code: WS_ErrorCode_DataFormat, userInfo: nil)
//                        print("Parsing not executed  #6")
//                        
//                        handler(false, nil, nil, customError)
//                    }
//                }
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
               
               
             
                url = "\(baseUrl)\(sMethod)"
               
               print(mType)
               var methodType : HTTPMethod
               if mType == .post {
                   methodType = .post
               }
               else
               {
                   methodType = .get
               }
               

                           
               
               

               Alamofire.request(url!, method: methodType, parameters: responseObj, encoding: JSONEncoding.default, headers: nil).responseJSON  { (response) in
                   
                   
                print(response.result)

  
                   
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
        
                           }
                           else {
                               
                               switch response.result {
                                   
                               case .success:
                                        print("hi")
                                   
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
           
       }
