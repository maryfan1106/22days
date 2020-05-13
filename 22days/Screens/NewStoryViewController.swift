//
//  NewStoryViewController.swift
//  22days
//
//  Created by Mary Fan on 5/12/20.
//  Copyright © 2020 Mary Fan. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

protocol AddNewStoryDelegate {
    func didTapPost(story: Story)
}

class NewStoryViewController: UIViewController {
    var addNewStoryDelegate: AddNewStoryDelegate!
    var newStory = Story(date: "May 15, 2020", title: "Moody Purples?", mood: "happy", reason: "school", story: "Last day of school!! Finally graduating 😭😭", backgroundImage: "image10")
    
    @IBOutlet weak var postButton: UIButton!
    @IBAction func postButtonTapped(_ sender: UIButton) {
        addNewStoryDelegate.didTapPost(story: newStory)
        AudioServicesPlayAlertSound(1306)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
