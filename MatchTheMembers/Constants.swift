//
//  MDB Mini Project 1 - Match the Members!
//
//  Constants.swift
//  Created by Will Oakley on 9/5/18.
//

import Foundation
import UIKit

class Constants {
    
    static let names = ["Aadhrik Kuila", "Aayush Tyagi", "Abhinav Kejriwal", "Abhinav Koppu", "Aditya Yadav", "Ajay Merchia", "Alice Zhao", "Amy Shen", "Anand Chandra", "Andres Medrano", "Andrew Santoso", "Angela Dong", "Anika Bagga", "Anita Shen", "Anmol Parande", "Ashwin Aggarwal", "Austin Davis", "Ayush Kumar", "Brandon David", "Candace Chiang", "Candice Ye", "Carol Wang", "Cody Hsieh", "Daniel Andrews", "DoHyun Cheon", "Eric Kong", "Ethan Wong", "Fang Shuo", "Izzie Lau", "Jacqueline Zhang", "Jaiveer Singh", "Japjot Singh", "Jeffrey Zhang", "Joey Hejna", "Julie Deng", "Justin Kim", "Kaden Dippe", "Kanyes Thaker", "Kayli Jiang", "Kiana Go", "Leon Kwak", "Levi Walsh", "Louie Mcconnell", "Max Miranda", "Melanie Cooray", "Michelle Mao", "Mohit Katyal", "Mudabbir Khan", "Natasha Wong", "Neha Nagabothu", "Nikhar Arora", "Noah Pepper", "Radhika Dhomse", "Richard Huang", "Sai Yandapalli", "Saman Virai", "Samantha Lee", "Sarah Tang", "Sharie Wang", "Shaurya Sanghvi", "Shiv Kushwah", "Shomil Jain", "Shreya Reddy", "Shubha Jagannatha", "Shubham Gupta", "Sinjon Santos", "Sourish Agarwal", "Srujay Korlakunta", "Stephen Jayakar", "Suyash Gupta", "Tiger Chen", "Tyler Reinecke", "Vaibhav Gattani", "Varun Jhunjhunwalla", "Victor Sun", "Vidya Ravikumar", "Vineeth Yeevani", "Wilbur Shi", "Will Oakley", "William Lu", "Xin Yi Chen", "Young Lin"]
    
    static func getImageFor(name: String) -> UIImage {
        let noWhitespace = name.components(separatedBy: .whitespaces).joined().lowercased()
        return UIImage(named: noWhitespace)!
    }
}

