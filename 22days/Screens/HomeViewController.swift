//
//  HomeViewController.swift
//  22days
//
//  Created by Mary Fan on 5/8/20.
//  Copyright © 2020 Mary Fan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var stories = [Story]()
    var isDarkMode = false
    let defaults = UserDefaults.standard
    
    struct Storyboard {
        static let CellIdentifier = "Story Cell"
    }
    
    struct Keys {
        static let prefersDarkMode  = "prefersDarkMode"
    }
    
    @IBOutlet weak var themeToggle: UISwitch!
    @IBOutlet weak var blurTheme: UIVisualEffectView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addNewStoryButton: UIButton!
    
    @IBAction func addNewStoryTapped(_ sender: UIButton ) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "NewStoryViewController") as! NewStoryViewController
        selectionVC.addNewStoryDelegate = self
        present(selectionVC, animated: true, completion: nil)
    }
    
    @IBAction func themeToggled(_ sender: UISwitch) {
        self.isDarkMode = !sender.isOn
        saveStylePreference()
        updateStyle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForStylePreference()
        Service.sharedInstance.getStories { (data, err) in
            self.stories = data!
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func saveStylePreference() {
        defaults.set(isDarkMode, forKey: Keys.prefersDarkMode)
    }
    
    func checkForStylePreference() {
        let prefersDarkMode = defaults.bool(forKey: Keys.prefersDarkMode)
        if prefersDarkMode {
            isDarkMode = true
            updateStyle()
            self.themeToggle.setOn(false, animated: true)
        }
    }
    
    func updateStyle() {
        UIView.animate(withDuration: 0.4) {
            self.blurTheme.effect = self.isDarkMode ? UIBlurEffect(style: .dark) : UIBlurEffect(style: .light)
        }
    }

}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! StoryCollectionViewCell
        cell.story = self.stories[indexPath.item]
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            StoryDetailsViewController, let index =
            collectionView.indexPathsForSelectedItems?.first {
            destination.story = stories[index.row]
        }
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left)/cellWidthIncludingSpacing
        let roundedIndex = round(index)
        offset = CGPoint(x: roundedIndex*cellWidthIncludingSpacing-scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}

extension HomeViewController: AddNewStoryDelegate {
    func didTapPost(story: Story) {
        self.stories.insert(story, at: 0)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
