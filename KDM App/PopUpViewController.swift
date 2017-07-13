//
//  PopUpViewController.swift
//  KDM App
//
//  Created by Wyatt Baggett on 7/12/17.
//  Copyright © 2017 Kingdom Digital Media. All rights reserved.
//

import Foundation
import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //Calling this func that will get called often will make it more OOP in design
        loadViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func tappedOutside(tapGestureRecognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
        // Your action
    }
    
    func loadViews() {
        popUpView.layer.cornerRadius = 10
        popUpView.layer.masksToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action:
            #selector(tappedOutside(tapGestureRecognizer:)))
        mainView.isUserInteractionEnabled = true
        mainView.addGestureRecognizer(tapGestureRecognizer)
    }
}
