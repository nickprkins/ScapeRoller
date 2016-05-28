//
//  FirstViewController.swift
//  ScapeRoller
//
//  Created by Nick Perkins on 5/25/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var attackDiceHolder : Array<AttackDefenseDie> = Array()
    var defenseDiceHolder : Array<AttackDefenseDie> = Array()

    
    @IBOutlet weak var attackCollectionView: UICollectionView!
    
    @IBOutlet weak var defenseCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call responsive background UIView Extension
        self.view.addBackground()
        
    }
    
    @IBAction func attackRollButtonPressed(sender: AnyObject) {
        
        self.attackCollectionView?.reloadData()
        
    }
    
    @IBAction func defenseRollButtonPressed(sender: AnyObject) {
        
        self.defenseCollectionView?.reloadData()
        
    }
    
    // When the user shakes their device it will roll Attack and Defense Dice
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            
            self.attackCollectionView?.reloadData()
            self.defenseCollectionView?.reloadData()
        
        }
    }
    
    
    @IBAction func addAttackButtonPressed(sender: AnyObject) {
        
        let newAttackDie = AttackDefenseDie()
        attackDiceHolder.append(newAttackDie)
        self.attackCollectionView?.reloadData()

    }
    
    @IBAction func subtractAttackButtonPressed(sender: AnyObject) {
        
        if attackDiceHolder.count != 0 {
            
            attackDiceHolder.removeLast()
            self.attackCollectionView?.reloadData()
            
        }
    }
    
    @IBAction func subtractDefenseButtonPressed(sender: AnyObject) {
        
        if defenseDiceHolder.count != 0 {
            
            defenseDiceHolder.removeLast()
            self.defenseCollectionView?.reloadData()
            
        }
        
    }
    @IBAction func addDefenseButtonPressed(sender: AnyObject) {
        
        let newDefenseDie = AttackDefenseDie()
        defenseDiceHolder.append(newDefenseDie)
        self.defenseCollectionView?.reloadData()
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.attackCollectionView {
        
            return self.attackDiceHolder.count
            
        }
        
        if collectionView == self.defenseCollectionView {
            
            return self.defenseDiceHolder.count
        }
        
        return 0
    }

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView == self.attackCollectionView {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("attackCell", forIndexPath: indexPath) as? attackDiceCollectionViewCell
            let thatDice = attackDiceHolder[indexPath.row]
            
            cell?.attackCellImageView.image = UIImage(named: thatDice.rollIt())
            
            return cell!
            
        }
        
        if collectionView == self.defenseCollectionView {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("defenseCell", forIndexPath: indexPath) as? defenseDiceCollectionViewCell
            let thatDice = defenseDiceHolder[indexPath.row]
            
            cell?.defenseCellImageView.image = UIImage(named: thatDice.rollIt())
            
            return cell!
            
        }
        
        return UICollectionViewCell()
    }
    
}

// Responsive UIView Extension for Background Image
extension UIView {
    func addBackground() {
        // screen width and height:
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
        imageViewBackground.image = UIImage(named: "scapeBackgroundBlue")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }}
