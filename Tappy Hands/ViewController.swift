//
//  ViewController.swift
//  Tappy Hands
//
//  Created by Minh Duong on 1/7/19.
//  Copyright © 2019 Minh Duong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var highScoreLable: UILabel!
    @IBOutlet var scoreLable: UILabel!
    @IBOutlet var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create the soft corners for the High Score label and the button
        highScoreLable.layer.cornerRadius = 5.0
        playButton.layer.cornerRadius = 5.0
        
        
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

}

