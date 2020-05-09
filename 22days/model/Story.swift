//
//  Story.swift
//  22days
//
//  Created by Mary Fan on 5/9/20.
//  Copyright © 2020 Mary Fan. All rights reserved.
//

import UIKit

class Story {
    // MARK:- Public API
    var date = ""
    var title = ""
    var mood = ""
    var reason = ""
    var story = ""
    var backgroundImage: UIImage!
    
    init(date: String, title: String, mood: String, reason: String, story: String) {
        self.date = date
        self.title = title
        self.mood = mood
        self.reason = reason
        self.story = story
        backgroundImage = UIImage(named: "image\(Int.random(in: 1..<16))")!
    }
    
    // MARK:- Private
    static func getStories() -> [Story] {
        // TODO: make get request
        return [
            Story(date: "May 1, 2020", title: "Moody Blues", mood: "happy", reason: "Work", story: "Had a great day at work today! Did really well in the standup and met some really cool people."),
            Story(date: "May 2, 2020", title: "Golden Experience", mood: "happy", reason: "School", story: "Got a 97 on my midterm! Finsihed all my work early so I can finally chill."),
            Story(date: "May 3, 2020", title: "Purple Haze", mood: "sad", reason: "Relationship", story: "Got into an argument with the boo because she thinks well done steak is acceptable..."),
            Story(date: "May 4, 2020", title: "Bites the Dust", mood: "meh", reason: "Family", story: "Family dinners are always a bummer. Aunties and uncles asking the usual. "),
            Story(date: "May 5, 2020", title: "Enigma", mood: "happy", reason: "Friends", story: "Hung out with high school peeps, went iceskating and got Korean food. I miss them so much ;_;"),
            Story(date: "May 6, 2020", title: "Bad Company", mood: "sad", reason: "Food", story: "Got a stomachache from Chipotle Sad bois."),
            Story(date: "May 7, 2020", title: "Made in Heaven", mood: "happy", reason: "Traveling", story: "Went hiking with college peeps. Don't forget bug spray next time."),
            Story(date: "May 8, 2020", title: "Black Sabbath", mood: "meh", reason: "Work", story: "So busy today, didn't even have time for lunch."),
            Story(date: "May 9, 2020", title: "Clash", mood: "happy", reason: "Food", story: "Baked cookies. The house smells so nice.")
        ]
    }
    
}