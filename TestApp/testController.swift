//
//  ViewController.swift
//  TestApp
//
//  Created by Akshay Nandane on 27/10/20.
//  Copyright © 2020 com.app.connectme. All rights reserved.
//

import UIKit

class testController: UIViewController {
    var fetchModel = testViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: UIImage(named: "london1"))
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(imageView)
        self.view.bringSubviewToFront(imageView)
        fetchModel.fetchdata(){ success in
            print("success : \(success)")
        }
    }
}

