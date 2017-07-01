//
//  AboutViewController.swift
//  KDM App
//
//  Created by Wyatt Baggett on 6/30/17.
//  Copyright © 2017 Kingdom Digital Media. All rights reserved.
//

import Foundation
import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var appVersion: UILabel!
    @IBOutlet weak var osVersion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appVersion.text = String(UIApplication.version())
        osVersion.text = "iOS " + String(UIDevice.current.systemVersion)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
