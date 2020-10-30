//
//  testViewModel.swift
//  TestApp
//
//  Created by Akshay Nandane on 27/10/20.
//  Copyright © 2020 com.app.connectme. All rights reserved.
//

import UIKit

class testViewModel {
    var testStore = testHttpStore()
    func fetchdata(completion: @escaping (_ success: Bool) -> Void) {
        let serverUrl = Bundle.main.object(forInfoDictionaryKey: "ServerURL") as! String
        testStore.makeAPICall(inputURL: serverUrl, completion: { response in
            print("testViewModel : response is \(response) in")
            do {
                let userResponse = try JSONDecoder().decode(Json4Swift_Base.self, from: response as! Data)
                print("userResponse \(userResponse)")
                completion(true)
            } catch let err{
                print(err)
                completion(false)
            }
        })
    }
}
