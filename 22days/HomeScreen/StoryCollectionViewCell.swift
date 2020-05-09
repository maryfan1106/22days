//
//  StoryCollectionViewCell.swift
//  22days
//
//  Created by Mary Fan on 5/9/20.
//  Copyright © 2020 Mary Fan. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    // MARK:- Public
    var story: Story! {
        didSet {
            updateUI()
        }
    }
    
    // MARK:- Private
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var moodImageView: UIImageView!
    @IBOutlet weak var storyTitleLabel: PaddingLabel!
    @IBOutlet weak var storyDateLabel: PaddingLabel!
    
    private func updateUI() {
        backgroundImageView?.image! = story.backgroundImage
        moodImageView?.image! = UIImage(named: story.mood)!
        storyTitleLabel?.text! = story.title
        storyDateLabel?.text! = story.date
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 20.0
        self.clipsToBounds = true
    }
    
}
