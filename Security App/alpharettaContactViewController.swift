//
//  alpharettaContactViewController.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 3/27/17.
//  Copyright © 2017 emilyosowski. All rights reserved.
//

import UIKit
import MessageUI

class alpharettaContactViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    
    
    
    @IBAction func officeCall(_ sender: Any) {

        
        let number = URL(string: "telprompt://7708233891")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(number)
        }
    }
    
    
    //    @IBAction func sosCall(_ sender: Any) {
    //
    //        let number = URL(string: "telprompt://44(0)2087628021")!
    //        if #available(iOS 10.0, *) {
    //            UIApplication.shared.open(number, options: [:], completionHandler: nil)
    //        } else {
    //            UIApplication.shared.openURL(number)
    //        }
    //    }
    
    @IBAction func sosAppLaunch(_ sender: Any) {
        if let url = NSURL(string: "isosassistance://"), UIApplication.shared.canOpenURL(url as URL) {
            //            UIApplication.shared.openURL(url as URL)
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        } else if let itunesUrl = NSURL(string: "https://itunes.apple.com/us/app/international-sos-assistance/id465662561?mt=8"), UIApplication.shared.canOpenURL(itunesUrl as URL) {
            //            UIApplication.shared.openURL(itunesUrl as URL)
            UIApplication.shared.open(itunesUrl as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    
    @IBAction func helpDeskCall(_ sender: Any) {

        
        let number = URL(string: "telprompt://18667729350")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(number)
        }
    }
    
    @IBAction func helpDeskEmail(_ sender: Any) {
        
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients(["help.us@vodafone.com"])
        mailVC.setSubject("")
        mailVC.setMessageBody("", isHTML: false)
        
        present(mailVC, animated: true, completion: nil)
        
    }
    
    @IBAction func cwtCall(_ sender: Any) {
        
        let number = URL(string: "telprompt://8002535095")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(number)
        }
    }
    
    @IBAction func cwtAppLaunch(_ sender: Any) {
        if let url = NSURL(string: "cwttogolaunch://"), UIApplication.shared.canOpenURL(url as URL) {
            //            UIApplication.shared.openURL(url as URL)
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        } else if let itunesUrl = NSURL(string: "https://itunes.apple.com/us/app/cwt-to-go/id634309682?mt=8"), UIApplication.shared.canOpenURL(itunesUrl as URL) {
            //            UIApplication.shared.openURL(itunesUrl as URL)
            UIApplication.shared.open(itunesUrl as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    
    
    
    @IBAction func evacuationPlan(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
