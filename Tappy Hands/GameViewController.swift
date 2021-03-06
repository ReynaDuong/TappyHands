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
    @IBOutlet var timeLable: UILabel!
    
    var tapInt = 0
    var startInt = 3
    var startTimer = Timer()
    
    var gameInt = 10
    var gameTimer = Timer()
    
    var recordData:String!

    static let BUTTON_TITLE = "Tap Me"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create the soft corners for labels and button
        timeRemainingLabel.layer.cornerRadius = 5.0
        scoreLabel.layer.cornerRadius = 5.0
        tapButton.layer.cornerRadius = 5.0
        
        // display the initial score
        tapInt = 0
        scoreLabel.text = String(tapInt)
        
        // display the timer till the game begins
        startInt = 3
        tapButton.setTitle(String(startInt), for: .normal)
        tapButton.isEnabled = false
        startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (GameViewController.startGameTimer), userInfo: nil, repeats: true)
        
        // display the initial time countdown
        gameInt = 10
        timeLable.text = String(gameInt)
        
        // get the current high score
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "Record")
        recordData = value
    }
    

    @objc func startGameTimer () {
        startInt -= 1
        tapButton.setTitle(String(startInt), for: .normal)
        
        if startInt == 0 {
            // stop the timer from working
            startTimer.invalidate()
            
            // change the button back
            tapButton.setTitle(GameViewController.BUTTON_TITLE, for: .normal)
            tapButton.isEnabled = true
            
            // enable the timer for the game
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (GameViewController.game), userInfo: nil, repeats: true)
        }
    }
    
    /*
     switch to the game screen
     */
    @objc func game() {
        // display the countdown time
        gameInt -= 1
        timeLable.text = String(gameInt)
        
        // timer ends
        if gameInt == 0 {
            gameTimer.invalidate()
            
            if (recordData == nil){
                // save the score to the key Record created
                let savedString = scoreLabel.text
                let userDefaults = Foundation.UserDefaults.standard
                userDefaults.set(savedString, forKey: "Record")
            }
            else{
                let score:Int? = Int(scoreLabel.text!)
                let record:Int? = Int(recordData)

                if score! > record!{
                    // save the score to Record
                    let savedString = scoreLabel.text
                    let userDefaults = Foundation.UserDefaults.standard
                    userDefaults.set(savedString, forKey: "Record")
                }

                tapButton.isEnabled = false
            }
            
            // change to the end game screen
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(GameViewController.endGame), userInfo: nil, repeats: false)
        }
    }
    
    
    /*
     switch to the end game screen
     */
    @objc func endGame() {
        
        // get view controller of the view endGame
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "endGame") as! EndViewController
        
        // store the score to scoreData in the endGame view
        vc.scoreData = scoreLabel.text
        
        self.present(vc, animated: false, completion: nil)
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
