//
//  Card.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 16-02-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Card {
    let competence: String
    let level: String
    let text: String
    let theme: String
    let title: String
    let ref: DatabaseReference?
    
    init(competence: String, level: String, text: String, theme: String, title: String) {
        self.competence = competence
        self.level = level
        self.text = text
        self.theme = theme
        self.title = title
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let dict = snapshot.value as! [String:AnyObject]
        self.competence = dict["competence"] as! String
        self.level = dict["level"] as! String
        self.text = dict["text"] as! String
        self.theme = dict["theme"] as! String
        self.title = dict["title"] as! String
        self.ref = snapshot.ref
    }
    
    /*
     * For sending an object back to Firebase
     */
    func toAnyObject()-> Any {
        return [
            "competence": competence,
            "level": level,
            "text": text,
            "theme": theme,
            "title": title
        ]
    }
}

