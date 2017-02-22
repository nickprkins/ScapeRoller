//
//  SecondViewController.swift
//  ScapeRoller
//
//  Created by Nick Perkins on 5/25/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

import UIKit
import CoreText
import SceneKit.ModelIO

class SecondViewController: UIViewController, UICollisionBehaviorDelegate {
    
    @IBOutlet var diceView: SCNView!
    //@IBOutlet var animationView: UIView!
    
    //var squareView:UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.addBackground()
        
        //draw20SidedDie()
        //drawSquare()
        
        
        
    }
    
    // When the user shakes their device it will roll Attack and Defense Dice
    override var canBecomeFirstResponder : Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            
            //AnimateDice()
            //animateSquare()
            
        }
    }
    
    func draw20SidedDie(){
        
        let die = CAShapeLayer()
        view.layer.addSublayer(die)
        die.opacity = 1.0
        die.lineJoin = kCALineJoinMiter
        //shape.strokeColor = UIColor.whiteColor().CGColor
        die.fillColor = UIColor.black.cgColor
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 206, y: 240))
        path.addLine(to: CGPoint(x: 305, y: 299))
        path.addLine(to: CGPoint(x: 306, y: 417))
        path.addLine(to: CGPoint(x: 205, y: 476))
        path.addLine(to: CGPoint(x: 102, y: 417))
        path.addLine(to: CGPoint(x: 104, y: 299))
        path.close()
        die.path = path.cgPath
        
    }
    
//    lazy var animator: UIDynamicAnimator = {
//        return UIDynamicAnimator(referenceView: self.view)
//    }()
//    
//    lazy var gravity:UIGravityBehavior = {
//        let lazyGravity = UIGravityBehavior()
//        return lazyGravity
//    }()
    
//    func AnimateDice() {
//        
//        animator.addBehavior(gravity)
//        let theDie = UIImageView(draw20SidedDie())
//        theDie.frame.size.height = 50.0
//        theDie.frame.size.width = 50.0
//        theDie.frame.origin.x = 206
//        theDie.frame.origin.y = 240
//        theDie.userInteractionEnabled = true
//        gravity.addItem(theDie)
//        
//        
//    }
    
//    func drawSquare(){
//        let squareSize = CGSize(width: 30.0, height: 30.0)
//        let centerPoint = CGPoint(x: self.animationView.bounds.midX - (squareSize.width/2), y: self.animationView.bounds.midY - (squareSize.height/2))
//        let frame = CGRect(origin: centerPoint, size: squareSize)
//        squareView = UIView(frame: frame)
//        squareView.backgroundColor = UIColor.orangeColor()
//        squareView.tag = 2
//        animationView.addSubview(squareView)
//    }
//    
//    lazy var animator: UIDynamicAnimator = {
//        return UIDynamicAnimator(referenceView: self.animationView)
//    }()
//    
//    lazy var gravity:UIGravityBehavior = {
//        let lazyGravity = UIGravityBehavior()
//        return lazyGravity
//    }()
//    
//    lazy var collider:UICollisionBehavior = {
//        let lazyCollider = UICollisionBehavior()
//        // This line, makes the boundries of our reference view a boundary
//        // for the added items to collide with.
//        lazyCollider.translatesReferenceBoundsIntoBoundary = true
//        return lazyCollider
//    }()
//    
//    lazy var resistance:UIDynamicItemBehavior = {
//        
//        let lazyBehavior = UIDynamicItemBehavior()
//        lazyBehavior.elasticity = 0.5
//        
//        return lazyBehavior
//    }()
//    
//    func animateSquare(){
//        
//        let instantaneousPush: UIPushBehavior = UIPushBehavior(items: [squareView], mode: UIPushBehaviorMode.Instantaneous)
//        
//        instantaneousPush.setAngle( CGFloat(M_PI_2) , magnitude: 0.7);
//        
//        
//        // 1. Add behaviors to the animator
//        animator.addBehavior(gravity)
//        animator.addBehavior(collider)
//        animator.addBehavior(resistance)
//        animator.addBehavior(instantaneousPush)
//        
//        
//        // 2. Add items to the behavior
//        gravity.addItem(squareView)
//        collider.addItem(squareView)
//        resistance.addItem(squareView)
//        instantaneousPush.addItem(squareView)
//        
//        
//    }

}
