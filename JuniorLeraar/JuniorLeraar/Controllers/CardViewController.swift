//
//  CardViewController.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 07-03-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CardViewController: UIViewController {

    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var deLeraarTextView: UITextView!
    @IBOutlet weak var reflectievragenTextView: UITextView!
    
    private var dialoguecardRef: DatabaseReference?
    var cardsArray = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupReferences()
        observeCards()
    }

    @IBAction func startbekwaamButton(_ sender: Any) {
        resultTextView.text = cardsArray[0].resultText
        deLeraarTextView.text = cardsArray[0].teacherText
        reflectievragenTextView.text = cardsArray[0].questionText
    }
    
    @IBAction func bekwaamButton(_ sender: Any) {
        resultTextView.text = cardsArray[0].teacherText
    }
    
    func setupReferences() {
        dialoguecardRef = Database.database().reference(withPath: "Dialoguecard")
        dialoguecardRef?.keepSynced(true)
        observeCards()
    }
    
    func observeCards() {
        dialoguecardRef?.observe(.value, with: { snapshot in
            for item in snapshot.children {
                if let cardSnapshot = item as? DataSnapshot {
                    let card = Card(snapshot: cardSnapshot)
                    self.cardsArray.append(card)
                }
            }
        })
    }
}
