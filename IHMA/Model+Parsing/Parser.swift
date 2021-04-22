//
//  Parser.swift
//  IHMA
//
//  Created by Nikil Davis on 22/04/21.
//
import Foundation
typealias Oncompletion = (_ sucess:Bool,_ msg:String,_ Resp:Any) -> Void
class Parser{
    static let shared = Parser()
    private init(){
    }
    func parserFile(completion:@escaping Oncompletion){
        
        guard let url = URL(string: URLBASE) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let _ = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do{
                let decoder = JSONDecoder()
                let jsonPetitions = try? decoder.decode([Content].self, from: data!)
               completion(true,"",jsonPetitions!)
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
    }
}
