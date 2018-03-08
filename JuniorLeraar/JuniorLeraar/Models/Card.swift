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
    let theme: String
    let title: String
    let teacherText: String
    let resultText: String
    let questionText: String
    let ref: DatabaseReference?
    
    init(competence: String, level: String, questionText: String, resultText: String, teacherText: String, theme: String, title: String) {
        self.competence = competence
        self.level = level
        self.theme = theme
        self.title = title
        self.teacherText = teacherText
        self.resultText = resultText
        self.questionText = questionText
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let dict = snapshot.value as! [String:AnyObject]
        self.competence = dict["competence"] as! String
        self.level = dict["level"] as! String
        self.questionText = dict["questionText"] as! String
        self.resultText = dict["resultText"] as! String
        self.teacherText = dict["teacherText"] as! String
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
            "theme": theme,
            "title": title,
            "teacherText": teacherText,
            "resultText": resultText,
            "questionText": questionText
        ]
    }
}

