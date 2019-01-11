//
//  EndViewController.swift
//  Tappy Hands
//
//  Created by Minh Duong on 1/9/19.
//  Copyright © 2019 Minh Duong. All rights reserved.
//

import UIKit
import Social
import MessageUI

class EndViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {

    @IBOutlet var scoreLable: UILabel!
    @IBOutlet var shareLabel: UILabel!
    
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet var emailButton: UIButton!
    @IBOutlet var smsButton: UIButton!
    @IBOutlet var restartButton: UIButton!
    
    var scoreData: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create soft corners for the buttons and labels
        scoreLable.layer.cornerRadius = 5.0
        shareLabel.layer.cornerRadius = 5.0
        twitterButton.layer.cornerRadius = 5.0
        emailButton.layer.cornerRadius = 5.0
        smsButton.layer.cornerRadius = 5.0
        restartButton.layer.cornerRadius = 5.0
        
        // display player's score
        scoreLable.text = scoreData
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     change the status bar style for each view
     */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    /*
     action of the button Restart
     */
    @IBAction func restartGame(_ sender: Any) {
        // go back to the game view
        self.dismiss(animated: false, completion: nil)
        
        // go back to the home view
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func shareTwitter(_ sender: Any) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
            let twitter:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            twitter.setInitialText("My final score was: \(String(describing: scoreLable.text))")
            
            self.present(twitter, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Account", message: "Please download Twitter app and log into your twitter account", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func shareEmail(_ sender: Any) {
        // check if can send email
        if MFMailComposeViewController.canSendMail(){
            let mail:MFMailComposeViewController = MFMailComposeViewController()
            
            mail.mailComposeDelegate = self
            
            mail.setCcRecipients(nil)
            mail.setSubject("My new record")
            mail.setMessageBody("My final score was: \(String(describing: scoreLable.text))", isHTML: false)
            
            self.present(mail, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Account", message: "Please log into your email account", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /*
     when the send email ends, stays in the app
    */
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func shareSMS(_ sender: Any) {
        if MFMessageComposeViewController.canSendText(){
            let message:MFMessageComposeViewController = MFMessageComposeViewController()
            
            message.messageComposeDelegate = self
            
            message.recipients = nil
            message.body = "My final score was: \(String(describing: scoreLable.text))!!!!"
            
            self.present(message, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Warning", message: "This device cannot send SMS messages", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
