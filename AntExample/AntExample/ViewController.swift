//
//  ViewController.swift
//  AntExample
//
//  Created by Pluto on 2017/7/11.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(getAntFileDir())
        let ant = AntDownloader.standardDownloader
        
    }
}

