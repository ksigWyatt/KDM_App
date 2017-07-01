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
        
        loadAppInformation()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadAppInformation() {
        let version : AnyObject! = Bundle.main.object(forInfoDictionaryKey:
                                        "CFBundleShortVersionString") as AnyObject
        
        var versionAsString = String(describing: version)
        //removing Optional() wrapper from the app release version
        versionAsString = versionAsString.replacingOccurrences(of: "Optional", with: "")
        versionAsString = versionAsString.replacingOccurrences(of: "(", with: "")
        versionAsString = versionAsString.replacingOccurrences(of: ")", with: "")
        
        appVersion.text = "Release " + versionAsString
        osVersion.text = "iOS " + String(UIDevice.current.systemVersion)
    }
    
}
