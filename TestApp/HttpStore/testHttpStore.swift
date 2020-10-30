//
//  testHttpStore.swift
//  TestApp
//
//  Created by Akshay Nandane on 27/10/20.
//  Copyright © 2020 com.app.connectme. All rights reserved.
//

import UIKit
import Alamofire

class testHttpStore{
    var result1: Any?
    func makeAPICall(inputURL: String, completion: @escaping (_ result: Any) -> Void){
        let session = URLSession.shared
        let url = URL(string: inputURL)!
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            //MARK: Check for error
            if error != nil || data == nil {
                print("error")
                return
            }
            //MARK: Check for status code
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    debugPrint("Handle server error")
                    return
            }
            //MARK: Check for mime
            guard let mime = response?.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            //MARK: Response handling
            if data != nil{
                completion(data as Any)
            }
        })
        task.resume()
    }
    
    
    
}

