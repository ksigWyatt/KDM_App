//
//  SecondViewController.swift
//  KDM App
//
//  Created by Wyatt Baggett on 6/20/17.
//  Copyright © 2017 Kingdom Digital Media. All rights reserved.
//

import UIKit
import MessageUI

class SecondViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var callUs: UIButton!
    @IBOutlet weak var emailUs: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func loadViewController() {
        //CALLING
        callUs.layer.cornerRadius = 0.5 * callUs.bounds.size.width
        callUs.layer.borderColor = UIColor(red:173.0/255.0, green:0/255.0,
                                              blue:0/255.0, alpha:1).cgColor as CGColor
        callUs.layer.borderWidth = 2.0
        callUs.clipsToBounds = true
        
        //EMAIL
        emailUs.layer.cornerRadius = 0.5 * emailUs.bounds.size.width
        emailUs.layer.borderColor = UIColor(red:173.0/255.0, green:0/255.0,
                                           blue:0/255.0, alpha:1).cgColor as CGColor
        emailUs.layer.borderWidth = 2.0
        emailUs.clipsToBounds = true
    }
    
    @IBAction func emailing(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            composeVC.setToRecipients(["kingdomdm3@gmail.com"])
            present(composeVC, animated: true, completion: nil)
            self.present(composeVC, animated: true, completion: nil)
            
        }
    }
    @IBAction func calling(_ sender: Any) {
        //hardcoding the phone number
        let tel = 8133582905 as UInt
        if let url = URL(string: "tel://\(tel)"){
            UIApplication.shared.openURL(url)
            print("Calling")
        }
    }
    
    //Handling email request for UI
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
            
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
            
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
            
        case MFMailComposeResult.failed.rawValue:
            print("Error: \(String(describing: error?.localizedDescription))")
            
        default:
            
            break
        }
        //after completion dismiss the view
        self.dismiss(animated: true, completion: nil)
    }
    
}

