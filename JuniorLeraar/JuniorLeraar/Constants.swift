//
//  Constants.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 07-03-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

struct Constants {
    
    //      PRAGMA MARK: Standard HvA Colors
    static let purpleblue = UIColor(red:37/255, green:22/255, blue:122/255, alpha:1.0)
    static let yellow = UIColor(red:255, green:210/255, blue:0, alpha:1.0)
    static let lightblue = UIColor(red:0, green:167/255, blue:211/255, alpha:1.0)
    static let darkblue = UIColor(red:45/255, green:108/255, blue:192/255, alpha:1.0)
    static let green = UIColor(red:112/255, green:161/255, blue:0, alpha:1.0)
    static let bordeauxred = UIColor(red:137/255, green:6/255, blue:86/255, alpha:1.0)
    static let orange = UIColor(red:239/255, green:116/255, blue:29/255, alpha:1.0)
    static let red = UIColor(red:211/255, green:17/255, blue:69/255, alpha:1.0)
    
    //      PRAGMA MARK: HvA Colors: Opacity 50%
    static let purpleblue50 = purpleblue.withAlphaComponent(0.5)
    static let yellow50 = yellow.withAlphaComponent(0.5)
    static let lightblue50 = lightblue.withAlphaComponent(0.5)
    
    //      PRAGMA MARK: HvA Colors: Opacity 20%
    static let purpleblue20 = purpleblue.withAlphaComponent(0.2)
    static let yellow20 = yellow.withAlphaComponent(0.2)
    static let lightblue20 = lightblue.withAlphaComponent(0.2)
    
    //      PRAGMA MARK: Firebase
    static func getRootRef() -> DatabaseReference { return Database.database().reference(withPath: firebaseCardsTable) }
    static let firebaseCardsTable = "Dialoguecard"
    
    //      PRAGMA MARK: Strings
    static let themeD = "Didactisch Bekwaam"
    static let themeC = "Collegiale Samenwerking"
    static let themeP = "Pedagogisch Bekwaam"
    static let levelS = "Startbekwaam"
    static let levelB = "Bekwaam"
    
    //      PRAGMA MARK: Seque Identifiers
    static let openCompetenceCard = "openCompetenceCard"
}
