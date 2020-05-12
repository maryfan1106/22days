//
//  Story.swift
//  22days
//
//  Created by Mary Fan on 5/9/20.
//  Copyright © 2020 Mary Fan. All rights reserved.
//

import UIKit

class Story: Decodable {
    // MARK:- Public API
    var date = ""
    var title = ""
    var mood = ""
    var reason = ""
    var story = ""
    var backgroundImage = ""
    
    init(date: String, title: String, mood: String, reason: String, story: String, backgroundImage: String) {
        self.date = date
        self.title = title
        self.mood = mood
        self.reason = reason
        self.story = story
        self.backgroundImage = backgroundImage
    }
}
