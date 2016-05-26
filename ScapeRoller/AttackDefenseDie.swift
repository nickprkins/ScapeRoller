//
//  AttackDefenseDie.swift
//  ScapeRoller
//
//  Created by Nick Perkins on 5/25/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

import UIKit


class AttackDefenseDie: AnyObject {
    
    
    var face: Int = 6
    let faces: [Int: String] = [0: "Attack", 1: "Defense", 2: "Blank", 3: "Attack", 4:"Attack", 5: "Defense"]
    
    func rollIt() -> String {
        
        let index: Int = Int(arc4random_uniform(UInt32(face-1)))
        let topFace = faces[index]
        
        return topFace!
    }
    
}
