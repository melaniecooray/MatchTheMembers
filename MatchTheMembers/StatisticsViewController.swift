//
//  StatisticsViewController.swift
//  MatchTheMembers
//
//  Created by Melanie Cooray on 2/8/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var longestStreak : Int!
    var results : [String]!
    var titleLabel : UILabel!
    var streakLabel : UILabel!
    var resultsTitleLabel : UILabel!
    var resultsString = ""
    var navBar : UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 200))
        titleLabel.text = "Statistics"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 50)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 50)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0;
        view.addSubview(titleLabel)
        
        streakLabel = UILabel(frame: CGRect(x: 0, y: view.frame.height/4, width: view.frame.width, height: 200))
        streakLabel.text = "Longest Streak: \(String(describing: Int(longestStreak)))"
        streakLabel.textAlignment = .center
        streakLabel.font = UIFont(name: "HelveticaNeue", size: 30)
        streakLabel.textColor = .yellow
        streakLabel.numberOfLines = 0;
        view.addSubview(streakLabel)
        
        for i in 0..<results.count {
            resultsString = "\(results[i]) " + resultsString
        }
        
        resultsTitleLabel = UILabel(frame: CGRect(x: 0, y: view.frame.height/2, width: view.frame.width, height: 200))
        if results.count == 0 {
            resultsTitleLabel.text = "No results to display"
        } else if results.count == 1 {
            resultsTitleLabel.text = "Results from last \(results.count) turn: \(resultsString)"
        } else {
            resultsTitleLabel.text = "Results from last \(results.count) turns: \(resultsString)"
        }
        resultsTitleLabel.textAlignment = .center
        resultsTitleLabel.font = UIFont(name: "HelveticaNeue", size: 30)
        resultsTitleLabel.textColor = .yellow
        resultsTitleLabel.numberOfLines = 0;
        view.addSubview(resultsTitleLabel)
        
        showNavBar()

    }
    
    func showNavBar() {
        navBar = UINavigationBar(frame: CGRect(x: 0, y: 35, width: view.frame.width, height: 100))
        
        let navItem = UINavigationItem(title: " ")
        let backButton = UIButton(type: .custom)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(backMove), for: .touchUpInside)
        navItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navBar.setItems([navItem], animated: false)
        view.addSubview(navBar)
    }
    
    @objc func backMove() {
        performSegue(withIdentifier: "toGame", sender: self)
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
