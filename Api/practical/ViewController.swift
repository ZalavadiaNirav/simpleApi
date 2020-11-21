//
//  ViewController.swift
//  practical
//
//  Created by Nirav  on 15/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    var arr:[Results]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callToGetData()
    }

    func callToGetData()
    {
        Network.shared.getData(description: "Jhon", location: "50", type: AlbumModel.self) { result in
            switch result{
            case .success(let res):
                self.arr = [Results]()
                self.arr = res.results
                print(self.arr)
            case .failure(let msg):
                print(msg)
            }
        }
    }

}
