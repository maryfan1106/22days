//
//  service.swift
//  22days
//
//  Created by Mary Fan on 5/12/20.
//  Copyright © 2020 Mary Fan. All rights reserved.
//

import Foundation

class Service {
    static let sharedInstance = Service()
    func getStories(completionHandler: @escaping ([Story]?, Error?) -> Void) {
        guard let url = URL(string: "https://twentytwodays.herokuapp.com/stories") else {
            completionHandler([
                Story(date: "May 1, 2020", title: "Moody Blues", mood: "happy", reason: "Work", story: "Had a great day at work today! Did really well in the standup and met some really cool people.", backgroundImage: "image1"),
                Story(date: "May 2, 2020", title: "Golden Experience", mood: "happy", reason: "School", story: "Got a 97 on my midterm! Finsihed all my work early so I can finally chill.", backgroundImage: "image2"),
                Story(date: "May 3, 2020", title: "Purple Haze", mood: "sad", reason: "Relationship", story: "Got into an argument with the boo because she thinks well done steak is acceptable...", backgroundImage: "image3"),
                Story(date: "May 4, 2020", title: "Bites the Dust", mood: "meh", reason: "Family", story: "Family dinners are always a bummer. Aunties and uncles asking the usual. ", backgroundImage: "image4"),
                Story(date: "May 5, 2020", title: "Enigma", mood: "happy", reason: "Friends", story: "Hung out with high school peeps, went iceskating and got Korean food. I miss them so much ;_;", backgroundImage: "image5"),
                Story(date: "May 6, 2020", title: "Bad Company", mood: "sad", reason: "Food", story: "Got a stomachache from Chipotle Sad bois.", backgroundImage: "image6"),
                Story(date: "May 7, 2020", title: "Made in Heaven", mood: "happy", reason: "Traveling", story: "Went hiking with college peeps. Don't forget bug spray next time.", backgroundImage: "image7"),
                Story(date: "May 8, 2020", title: "Black Sabbath", mood: "meh", reason: "Work", story: "So busy today, didn't even have time for lunch.", backgroundImage: "image8"),
                Story(date: "May 9, 2020", title: "Clash", mood: "happy", reason: "Food", story: "Baked cookies. The house smells so nice.", backgroundImage: "image9")
            ],nil)
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url, completionHandler: { (data, response, error) in
            if let data = data {
                do {
                    let stories = try JSONDecoder().decode([Story].self, from: data)
                    completionHandler(stories, nil)
                } catch {
                    print(error)
                    completionHandler(nil, error)
                }
            }
        }).resume()
        
    }
}
