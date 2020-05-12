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

    @IBOutlet weak var postButton: UIButton!
    @IBAction func postButtonTapped(_ sender: UIButton) {
        addNewStoryDelegate.didTapPost(story:
            Story(date: "May 12, 2020", title: "Moody Purples?", mood: "sad", reason: "school", story: "iOS dev is killing me.", backgroundImage: "image10")
        )
        AudioServicesPlayAlertSound(1306)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
