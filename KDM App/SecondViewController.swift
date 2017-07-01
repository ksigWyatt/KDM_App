//
//  SecondViewController.swift
//  KDM App
//
//  Created by Wyatt Baggett on 6/20/17.
//  Copyright © 2017 Kingdom Digital Media. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        addButton.layer.cornerRadius = 0.5 * addButton.bounds.size.width
        addButton.layer.borderColor = UIColor(red:0.0/255.0, green:122.0/255.0,
                                              blue:255.0/255.0, alpha:1).cgColor as CGColor
        addButton.layer.borderWidth = 2.0
        addButton.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

