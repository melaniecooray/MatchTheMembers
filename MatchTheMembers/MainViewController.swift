//
//  MainViewController.swift
//  MatchTheMembers
//
//  Created by Melanie Cooray on 2/6/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var memberImageView : UIImageView!
    var memberIndex : Int!
    var options : [Int] = []
    var buttonOptions : [UIButton] = []
    var score : Int! = 0
    var scoreLabel : UILabel!
    var startStopButton : UIButton!
    var timer = Timer()
    var timerRunCount : Int! = 0
    var buttonTimerRunCount : Int! = 0
    var timerLabel : UILabel!
    var buttonTimer = Timer()
    var longestStreak : Int! = 0
    var currentStreak : Int! = 0
    var results : [String] = []
    var clicked : Bool = false
    var navBar : UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //set background color
        self.view.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1)
        
        showNavBar()
        memberIndex = getPerson()
        showOptions()
        startButton()
        displayScore()
    }
    
    func showNavBar() {
        navBar = UINavigationBar(frame: CGRect(x: 0, y: 35, width: view.frame.width, height: 100))
        
        let navItem = UINavigationItem(title: "Match the Members")
        navItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(showStatistics))
        let backButton = UIButton(type: .custom)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(backMove), for: .touchUpInside)
        navItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navBar.setItems([navItem], animated: false)
        view.addSubview(navBar)
    }
    
    func getPerson() -> Int {
        //choses a random index of the names array
        let randomInt = arc4random_uniform(UInt32(Constants.names.count))
        memberImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 350, height: 350))
        memberImageView.center = CGPoint(x: view.frame.width/2, y: (view.frame.height/3) + 50)
        
        //gets the image associated with the randomInt
        memberImageView.image = Constants.getImageFor(name: Constants.names[Int(randomInt)])
        view.addSubview(memberImageView)
        return Int(randomInt)
    }
    
    func showOptions() {
        
        //add buttons to buttonOptions array
        buttonOptions.append(UIButton(frame: CGRect(x: 10, y: 600, width: view.frame.width/2 - 20, height: 50)))
        buttonOptions.append(UIButton(frame: CGRect(x: buttonOptions[0].frame.maxX + 20, y: 600, width: view.frame.width/2 - 20, height: 50)))
        buttonOptions.append(UIButton(frame: CGRect(x: 10, y: buttonOptions[0].frame.maxY + 50, width: view.frame.width/2 - 20, height: 50)))
        buttonOptions.append(UIButton(frame: CGRect(x: buttonOptions[0].frame.maxX + 20, y: buttonOptions[1].frame.maxY + 50, width: view.frame.width/2 - 20, height: 50)))
        
        // sets up buttons
        for i in 0..<4 {
            buttonOptions[i].backgroundColor = .yellow
            buttonOptions[i].setTitleColor(.black, for: .normal)
            buttonOptions[i].layer.cornerRadius = 15
            buttonOptions[i].addTarget(self, action: #selector(optionClicked), for: .touchUpInside)
            buttonOptions[i].isEnabled = true
            view.addSubview(buttonOptions[i])
        }
        
        // sets title of buttons
        getRandomName(correctIndex: memberIndex)
    }
    
    func getRandomName(correctIndex : Int) {
        let rand = arc4random_uniform(4)
        for i in 0..<4 {
            if rand == i {
                buttonOptions[i].setTitle(Constants.names[correctIndex], for: .normal)
                options.append(correctIndex)
            } else {
                buttonOptions[i].setTitle(Constants.names[getRandomNumber()], for: .normal)
            }
        }
    }
    
    func getRandomNumber() -> Int {
        let rand = arc4random_uniform(UInt32(Constants.names.count))
        for x in buttonOptions {
            if x.currentTitle == Constants.names[Int(rand)] {
                return getRandomNumber()
            }
        }
        return Int(rand)
        
    }
    
    // sets up the start and stop button on the bottom left of the screen
    func startButton(){
        startStopButton = UIButton(frame: CGRect(x: 20, y: 100, width: 70, height: 50))
        startStopButton.setTitle("Stop", for: .normal)
        startStopButton.addTarget(self, action: #selector(startClicked), for: .touchUpInside)
        startStopButton.backgroundColor = .blue
        startStopButton.layer.cornerRadius = 15
        timerLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        timerLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        //timerLabel.text = "5"
        view.addSubview(timerLabel)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        view.addSubview(startStopButton)
    }
    
    // displays the score
    func displayScore() {
        scoreLabel = UILabel(frame: CGRect(x: 300, y: 100, width: 100, height: 50))
        scoreLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        scoreLabel.text = "Score: 0"
        score = 0
        view.addSubview(scoreLabel)
    }
    
    // action for when one of the name options is clicked
    @objc func optionClicked(sender : UIButton) {
        clicked = true
        for option in buttonOptions {
            option.isEnabled = false
        }
        if sender.currentTitle == Constants.names[memberIndex] {
            sender.backgroundColor = .green
            score += 1
            scoreLabel.text = "Score: \(score!)"
            results.append("Correct")
            currentStreak += 1
            if currentStreak > longestStreak {
                longestStreak = currentStreak
            }
            //timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        } else {
            sender.backgroundColor = .red
            results.append("Incorrect")
            currentStreak = 0
        }
        //timerLabel.text = "5"
        if results.count > 3 {
            results.remove(at: 0)
        }
        timerRunCount = 0
        buttonTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(buttonTimerFunc), userInfo: nil, repeats: true)
    }
    
    // action for when the start/stop button is clicked
    @objc func startClicked(sender : UIButton) {
        if sender.currentTitle == "Start" {
            sender.setTitle("Stop", for: .normal)
        } else if sender.currentTitle == "Stop" {
            timer.invalidate()
            sender.setTitle("Start", for: .normal)
        }
    }
    
    // action for countdown timer
    @objc func fireTimer() {
        timerLabel.text = String(5 - timerRunCount)
        if timerRunCount == 5 {
            timerRunCount = 0
            results.append("Incorrect")
            memberIndex = getPerson()
            showOptions()
        }
        timerRunCount += 1
    }
    
    //action to wait one second after changing color of option clicked
    @objc func buttonTimerFunc() {
        if clicked {
            if buttonTimerRunCount == 1 {
                buttonTimerRunCount = 0
                timerRunCount = 0
                clicked = false
                memberIndex = getPerson()
                showOptions()
            }
            buttonTimerRunCount += 1
        }
    }
    
    @objc func showStatistics() {
        performSegue(withIdentifier: "toStatistics", sender: self)
    }
    
    @objc func backMove() {
        performSegue(withIdentifier: "toWelcome", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newScreen = segue.destination as? StatisticsViewController {
            newScreen.longestStreak = longestStreak
            newScreen.results = results
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
