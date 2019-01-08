//
//  ViewController.swift
//  Tappy Hands
//
//  Created by Minh Duong on 1/7/19.
//  Copyright © 2019 Minh Duong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var HighScoreLable: UILabel!
    @IBOutlet var ScoreLable: UILabel!
    @IBOutlet var PlayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create the soft corners for the High Score label and the button
        HighScoreLable.layer.cornerRadius = 5.0
        PlayButton.layer.cornerRadius = 5.0
        
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

