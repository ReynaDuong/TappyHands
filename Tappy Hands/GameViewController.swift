//
//  GameViewController.swift
//  Tappy Hands
//
//  Created by Minh Duong on 1/8/19.
//  Copyright © 2019 Minh Duong. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    // labels
    @IBOutlet var timeRemainingLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var tapButton: UIButton!
    
    // tap times
    var tapInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create the soft corners for labels and button
        timeRemainingLabel.layer.cornerRadius = 5.0
        scoreLabel.layer.cornerRadius = 5.0
        tapButton.layer.cornerRadius = 5.0
        
        // display the initial score
        tapInt = 0
        scoreLabel.text = String(tapInt)
        
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

    
    @IBAction func tapMeButton(_ sender: Any) {
        tapInt += 1
        scoreLabel.text = String(tapInt)
    }
    
}
