//
//  FirstViewController.swift
//  DrinkMixer
//
//  Created by Robert S Mozayeni on 9/6/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, "http://httpbin.org/get").responseString { (request, response, string, error) -> Void in
            println("We got a response: \(string)")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

