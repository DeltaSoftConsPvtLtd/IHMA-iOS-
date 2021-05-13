//
//  ApiClient.swift
//  IHMA
//
//  Created by Nikil Davis on 12/05/21.
//

import Foundation
import Alamofire

typealias OnCompletion =  (_ success: Bool, _ object: Any?,_ Alert : String?) -> ()

class ApiClient{
    
    static let shared = ApiClient()
    private init(){
    }
    
    let searchUrl : (String) -> URLRequest = { url in
        let url = url.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        let myUrl = URL(string: url)!
        var Newrequest = URLRequest(url: myUrl)
        Newrequest.httpMethod = "POST"
        Newrequest.setValue("application/json", forHTTPHeaderField: "content-type")
        Newrequest.setValue("Autherization Bareer", forHTTPHeaderField: "Authorization")
        return Newrequest
    }
    
    func makeJSONData1<T:Encodable>(_ value: T) -> String {
        var jsonData = Data()
        let jsonEncoder = JSONEncoder()
        
        do {
            jsonData = try jsonEncoder.encode(value)
        }
        catch {
        }
        return String(data: jsonData, encoding: .utf8)!
    }
    
    func getData<T:Encodable,U:Decodable>(_ Url : String, _ req : T, _ resp : U.Type,completion:@escaping OnCompletion){
        var link = searchUrl(Url)
        link.httpBody = makeJSONData1(req).data(using: .utf8)
        serializeJSONRequest(link) { (response) in
            print(response)
            
            let json = String(data: response.data!, encoding: String.Encoding.utf8)
              print(json!)
            
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let responseOBJ = try decoder.decode(U.self, from: response.data!)
                    completion(true, (responseOBJ as Any),"sucess")
                } catch let err {
                   print("Err  ", err)
                }
            case .failure( let error):
                break
            }
        }
    }
    
    
    func serializeJSONRequest(_ request : URLRequest , completionHandler: @escaping (DataResponse<Any>) -> Void){
        Alamofire.request(request).validate(statusCode: 200..<500).responseJSON { response in
            print(response)
            completionHandler(response)
        }
    }
}
