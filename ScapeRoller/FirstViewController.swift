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
    
    @IBAction func attackRollButtonPressed(_ sender: AnyObject) {
        
        self.attackCollectionView?.reloadData()
        
    }
    
    @IBAction func defenseRollButtonPressed(_ sender: AnyObject) {
        
        self.defenseCollectionView?.reloadData()
        
    }
    
    // When the user shakes their device it will roll Attack and Defense Dice
    override var canBecomeFirstResponder : Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            
            self.attackCollectionView?.reloadData()
            self.defenseCollectionView?.reloadData()
        
        }
    }
    
    
    @IBAction func addAttackButtonPressed(_ sender: AnyObject) {
        
        let newAttackDie = AttackDefenseDie()
        attackDiceHolder.append(newAttackDie)
        self.attackCollectionView?.reloadData()

    }
    
    @IBAction func subtractAttackButtonPressed(_ sender: AnyObject) {
        
        if attackDiceHolder.count != 0 {
            
            attackDiceHolder.removeLast()
            self.attackCollectionView?.reloadData()
            
        }
    }
    
    @IBAction func subtractDefenseButtonPressed(_ sender: AnyObject) {
        
        if defenseDiceHolder.count != 0 {
            
            defenseDiceHolder.removeLast()
            self.defenseCollectionView?.reloadData()
            
        }
        
    }
    @IBAction func addDefenseButtonPressed(_ sender: AnyObject) {
        
        let newDefenseDie = AttackDefenseDie()
        defenseDiceHolder.append(newDefenseDie)
        self.defenseCollectionView?.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.attackCollectionView {
        
            return self.attackDiceHolder.count
            
        }
        
        if collectionView == self.defenseCollectionView {
            
            return self.defenseDiceHolder.count
        }
        
        return 0
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.attackCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "attackCell", for: indexPath) as? attackDiceCollectionViewCell
            let thatDice = attackDiceHolder[indexPath.row]
            
            cell?.attackCellImageView.image = UIImage(named: thatDice.rollIt())
            
            return cell!
            
        }
        
        if collectionView == self.defenseCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "defenseCell", for: indexPath) as? defenseDiceCollectionViewCell
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
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "scapeBackgroundBlue")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        
        self.addSubview(imageViewBackground)
        self.sendSubview(toBack: imageViewBackground)
    }}
