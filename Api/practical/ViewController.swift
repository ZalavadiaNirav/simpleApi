//
//  ViewController.swift
//  practical
//
//  Created by Nirav  on 15/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callToGetData()
    }

    func callToGetData()
    {
        Network.shared.getData(description: "Software Developer", location: "San Francisco") { result in
            switch result{
            case .success(let results):
                print(results)
            case .failure(let msg):
                print(msg)
            }
        }
    }

}
