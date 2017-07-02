//
//  ContactViewController.swift
//  KDM App
//
//  Created by Wyatt Baggett on 6/20/17.
//  Copyright © 2017 Kingdom Digital Media. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var callUs: UIButton!
    @IBOutlet weak var emailUs: UIButton!
    let alertTitle = "Alert"
    let cancel = "Cancel"
    
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
        callUs.layer.cornerRadius = 0.03 * callUs.bounds.size.width
        callUs.layer.borderColor = UIColor(red:173.0/255.0, green:0/255.0,
                                              blue:0/255.0, alpha:1).cgColor as CGColor
        callUs.layer.borderWidth = 1.0
        callUs.clipsToBounds = true
        
        //EMAIL
        emailUs.layer.cornerRadius = 0.03 * emailUs.bounds.size.width
        emailUs.layer.borderColor = UIColor(red:173.0/255.0, green:0/255.0,
                                           blue:0/255.0, alpha:1).cgColor as CGColor
        emailUs.layer.borderWidth = 1.0
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
    
    //Program to something else for now
    let fbURLID: URL = URL(string: "fb://profile/862322537253794")!
    @IBAction func openFacebook(_ sender: Any) {
        print("\nOpening in Facebook")
        
        if UIApplication.shared.canOpenURL(fbURLID){
            //checks to see if FB is installed
            UIApplication.shared.openURL(fbURLID)
        }
        else {
            let message = "You need to download the Facebook app first"
            let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let cancelButton = UIAlertAction(title: cancel, style: UIAlertActionStyle.cancel, handler: nil)
            let downloadFacebook = UIAlertAction(title: "Download", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                
                if let link = URL(string: "itms-apps://itunes.apple.com/app/id284882215"),
                    UIApplication.shared.canOpenURL(link){
                    UIApplication.shared.openURL(link)
                }
                
            })
            alert.addAction(cancelButton)
            alert.addAction(downloadFacebook)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    let instagramHooks = "instagram://user?username=kingdom_digital_media"
    @IBAction func openInsta(_ sender: Any) {
        print("\nOpening in Insta")
        
        /*This let statement MUST be inside the IBAction because otherwise the
         instragramHooks variable isn't able to be used for some reason
         
         ERROR IS: Cannot use instance member 'instagramHooks' within property
         initializer; property initializers run before 'self' is available
         
         */
        let instagramUrl = URL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl!) {
            UIApplication.shared.openURL(instagramUrl!)
        }
        else {
            let message = "You need to download the Instagram app first"
            let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let cancelButton = UIAlertAction(title: cancel, style: UIAlertActionStyle.cancel, handler: nil)
            let downloadInstagram = UIAlertAction(title: "Download", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                
                if let link = URL(string: "itms-apps://itunes.apple.com/app/id389801252"),
                    UIApplication.shared.canOpenURL(link){
                    UIApplication.shared.openURL(link)
                }
                
            })
            alert.addAction(cancelButton)
            alert.addAction(downloadInstagram)
            
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    //Program to something else for now
    let twitterID: URL = URL(string: "twitter:///user?screen_name=KingdomDM3")!
    @IBAction func openTwitter(_ sender: Any) {
        print("\nOpening in Twitter")
        
        if UIApplication.shared.canOpenURL(twitterID) {
            //checks to see if Twitter is installed
            UIApplication.shared.openURL(twitterID)
        }
        else {
            let message = "You need to download the Twitter app first"
            let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let cancelButton = UIAlertAction(title: cancel, style: UIAlertActionStyle.cancel, handler: nil)
            let downloadTwitter = UIAlertAction(title: "Download", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                
                if let link = URL(string: "itms-apps://itunes.apple.com/app/id409789998"),
                    UIApplication.shared.canOpenURL(link){
                    UIApplication.shared.openURL(link)
                }
                
            })
            alert.addAction(cancelButton)
            alert.addAction(downloadTwitter)
            
            present(alert, animated: true, completion: nil)
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

