//
//  ViewController.swift
//  NetworkLayerTest
//
//  Created by Amit on 11/09/22.
//

import UIKit
import Networking

class ViewController: UIViewController {
    let newAPIHandler = NewsAPIHandler()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //            print("Received Result \(result)")

        newAPIHandler.getAllNews { result in
            print("Received Result \(result)")
        }
    }


}

