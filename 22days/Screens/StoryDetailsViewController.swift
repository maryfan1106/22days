//
//  StoryDetailsViewController.swift
//  22days
//
//  Created by Mary Fan on 5/11/20.
//  Copyright © 2020 Mary Fan. All rights reserved.
//

import UIKit

class StoryDetailsViewController: UIViewController {
    var story: Story!
    
    @IBOutlet weak var storyTitleLabel: PaddingLabel!
    @IBOutlet weak var storyDateLabel: PaddingLabel!
    @IBOutlet weak var storyReasonLabel: PaddingLabel!
    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var moodImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyTitleLabel.text = story.title
        storyDateLabel.text = story.date
        storyReasonLabel.text = story.reason
        storyTextView.text = story.story
        backgroundImageView.image = UIImage(named: story.backgroundImage)
        moodImageView.image = UIImage(named: story.mood)
    }

}
