//
//  FirstViewController.swift
//  ScapeRoller
//
//  Created by Nick Perkins on 5/25/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

import UIKit


// Responsive UIView Extension for Background Image
extension UIView {
    func addBackground() {
        // screen width and height:
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
        imageViewBackground.image = UIImage(named: "scapeBackground")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }}

class FirstViewController: UIViewController {

    
    @IBOutlet weak var attackCollectionView: UICollectionView!
    
    @IBOutlet weak var defenseCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call responsive background UIView Extension
        self.view.addBackground()
        
        
        
    }
    
    
    @IBAction func addAttackButtonPressed(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func subtractAttackButtonPressed(sender: AnyObject) {
        
        
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView == self.attackCollectionView {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("attackCell", forIndexPath: indexPath) as UICollectionViewCell
            
            return cell
            
        } else { // do not do this check: if collectionView == self.hourCollectionView {
            
//            let cell: = collectionView.dequeueReusableCellWithReuseIdentifier("defenseCell", forIndexPath: indexPath) as UICollectionViewCell
//            
//            
//            return cell
        }
    }
    
}
