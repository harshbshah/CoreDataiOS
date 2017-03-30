//
//  ViewController.swift
//  CoreDataTesting
//
//  Created by Harsh Shah on 2017-03-29.
//  Copyright © 2017 Harsh Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CoreDataManager.storeObj()
        CoreDataManager.fetchObj()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

