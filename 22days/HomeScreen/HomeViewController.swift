//
//  HomeViewController.swift
//  22days
//
//  Created by Mary Fan on 5/8/20.
//  Copyright © 2020 Mary Fan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK:- IBOutlets

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addNewStoryButton: UIButton!
    
    // MARK:- UICollectionViewDataSource
    private var stories = Story.getStories()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private struct Storyboard {
        static let CellIdentifier = "Story Cell"
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
