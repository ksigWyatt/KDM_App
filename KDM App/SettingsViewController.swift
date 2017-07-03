//
//  SettingsViewController.swift
//  KDM App
//
//  Created by Wyatt Baggett on 7/2/17.
//  Copyright © 2017 Kingdom Digital Media. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class SettingsViewCotroller: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var firstSwitch: UISwitch!
    let file = "log_data.txt" //We will write to and read from this
    let text = "some text"
    let stringFromDate = Date().iso8601    // "2017-03-22T13:22:13.933Z"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let dateFromString = stringFromDate.dateFromISO8601
        print("\nTS: " + (dateFromString?.iso8601)! + "(EST)")      // "2017-03-22T13:22:13.933Z"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeFirst(_ sender: Any) {
        // The default will be on so the view needs to initalize
        // whatever needs to happen first
        if (firstSwitch.isOn) {
            print("It's on")
        }
        else {
            print("It's off now")
        }
    }
    
    
    @IBAction func sendSupportEmail(_ sender: Any) {
        //Creating a UUID of 10 characters
        let last15Chars = String(UUID().uuidString.characters.suffix(15))
        print("\n\(last15Chars)")
        let OSVerison = UIDevice.current.systemVersion
        print(OSVerison)
            
        
        //Write to a file all the important System infor in order to add it to the email
//        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//
//            let path = dir.appendingPathComponent(file)
//
//            //writing
//            do {
//                try text.write(to: path, atomically: false, encoding: String.Encoding.utf8)
//            }
//            catch {/* error handling here */}
//        }
        
        
        if MFMailComposeViewController.canSendMail() {
            
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            composeVC.setToRecipients(["kingdomdm3@gmail.com"])
            composeVC.setSubject("Support Request: \(last15Chars)")
            //composeVC.
            //composeVC.addAttachmentData(_, mimeType: "_", fileName: file)
            present(composeVC, animated: true, completion: nil)
            self.present(composeVC, animated: true, completion: nil)
            
        }
    }
    
 func setToSendData() {
        // Register for Firebase
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
