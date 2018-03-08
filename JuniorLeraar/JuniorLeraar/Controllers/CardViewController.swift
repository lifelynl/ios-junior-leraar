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
    
    @IBOutlet weak var bekwaamButton: UIBarButtonItem!
    @IBOutlet weak var startbekwaamButton: UIBarButtonItem!
    private var dialoguecardRef: DatabaseReference?
    var cardsArray = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupReferences()
        observeCards()
    }

    @IBAction func startbekwaamButton(_ sender: Any) {
        setStartbekwaamCardText()
    }
    
    @IBAction func bekwaamButton(_ sender: Any) {
        setBekwaamCardText()
    }
    
    func setStartbekwaamCardText() {
        navigationItem.title = "Startbekwaam"
        bekwaamButton.tintColor = Constants.purpleblue
        startbekwaamButton.tintColor = UIColor.black
        resultTextView.text = cardsArray[0].resultText
        deLeraarTextView.text = cardsArray[0].teacherText.replacingOccurrences(of: "#", with: "\n∙")
        reflectievragenTextView.text = cardsArray[0].questionText.replacingOccurrences(of: "#", with: "\n∙")
    }
    
    func setBekwaamCardText() {
        navigationItem.title = "Bekwaam"
        startbekwaamButton.tintColor = Constants.purpleblue
        bekwaamButton.tintColor = UIColor.black
        resultTextView.text = cardsArray[1].resultText
        deLeraarTextView.text = cardsArray[1].teacherText.replacingOccurrences(of: "#", with: "\n∙")
        reflectievragenTextView.text = cardsArray[1].questionText.replacingOccurrences(of: "#", with: "\n∙")
    }
    
    func setupReferences() {
        dialoguecardRef = Constants.getRootRef()
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
            self.setStartbekwaamCardText()
        })
    }
}
