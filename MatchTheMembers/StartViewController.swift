//
//  ViewController.swift
//  MatchTheMembers
//
//  Created by Melanie Cooray on 2/6/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    var titleLabel : UILabel!
    var startButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set background color
        //self.view.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        
        // title label
        titleLabel = UILabel(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 200))
        titleLabel.text = "Match the\nMembers"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 70)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 50)
        titleLabel.textColor = .yellow
        titleLabel.numberOfLines = 0;
        view.addSubview(titleLabel)
        
        // start button
        startButton = UIButton(frame: CGRect(x: view.frame.width/4, y: titleLabel.frame.maxY + 150, width: view.frame.width/2, height: 50))
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.backgroundColor = .yellow
        startButton.layer.cornerRadius = 15
        startButton.addTarget(self, action: #selector(startClicked), for: .touchUpInside)
        view.addSubview(startButton)
    }
    
    //action for clicking the start button to move to the main view controller
    @objc func startClicked() {
        performSegue(withIdentifier: "toMain", sender: self)
    }

}

