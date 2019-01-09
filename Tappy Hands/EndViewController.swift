//
//  EndViewController.swift
//  Tappy Hands
//
//  Created by Minh Duong on 1/9/19.
//  Copyright © 2019 Minh Duong. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

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
    
    /*
     action of the button Restart
     */
    @IBAction func restartGame(_ sender: Any) {
        // go back to the game view
        self.dismiss(animated: false, completion: nil)
        
        // go back to the home view
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
}
