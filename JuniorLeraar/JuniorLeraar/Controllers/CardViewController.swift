//
//  CardViewController.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 07-03-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit
import FirebaseDatabase
import PopupDialog

class CardViewController: UIViewController {

    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var deLeraarTextView: UITextView!
    @IBOutlet weak var reflectievragenTextView: UITextView!
    
    @IBOutlet weak var bekwaamButton: UIBarButtonItem!
    @IBOutlet weak var startbekwaamButton: UIBarButtonItem!
    @IBOutlet weak var cardToolbar: UIToolbar!
    private var dialoguecardRef: DatabaseReference?
    private var checkcardRef: DatabaseReference?
    var cardsArray = [Card]()
    var selectedCard = ""
    var currentTheme: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupReferences()
        observeCards()
        setupStyling()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "check-icon-red"), style: .done, target: self, action: #selector(addTapped))
//        navigationItem.rightBarButtonItem?.tintColor = UIColor.green
    }
    
    @objc func addTapped() {
        popupDialog()
        
        for card in cardsArray {
            if (card.title == selectedCard && card.level.lowercased() == Constants.levelS.lowercased()) {
                let vari = checkcardRef?.child(Constants.DeviceID).childByAutoId()
                vari?.setValue(card.toAnyObject())
            }
        }
    }
    
    func setupStyling() {
        navigationItem.title = Constants.levelS
    }
    
    func popupDialog() {
        // Customize dialog appearance
        let pv = PopupDialogDefaultView.appearance()
        pv.titleFont    = UIFont(name: "HelveticaNeue-Light", size: 16)!
        pv.titleColor   = Constants.purpleblue
        pv.messageFont  = UIFont(name: "HelveticaNeue", size: 14)!
        pv.messageColor = Constants.purpleblue
        
        // Customize the container view appearance
        let pcv = PopupDialogContainerView.appearance()
        pcv.backgroundColor = Constants.yellow
        pcv.cornerRadius    = 10
        pcv.shadowEnabled   = true
        pcv.shadowColor     = Constants.yellow
        
        // Customize overlay appearance
        let ov = PopupDialogOverlayView.appearance()
        ov.blurEnabled     = true
        ov.blurRadius      = 30
        ov.liveBlurEnabled = true
        ov.opacity         = 0.5
        ov.color           = Constants.yellow
        
        // Customize default button appearance
        let db = DefaultButton.appearance()
        db.titleFont      = UIFont(name: "HelveticaNeue-Medium", size: 14)!
        db.titleColor     = Constants.purpleblue
        db.buttonColor    = Constants.yellow
        db.separatorColor = Constants.purpleblue
        
        // Prepare the popup assets
        let title = "Kaart Afronden"
        let message = "Wil jij deze kaart afronden?"
        let image = UIImage(named: "pexels-photo-103290")
        
        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image, buttonAlignment: .horizontal, transitionStyle: .fadeIn)
        
        // Create buttons
        let buttonOne = DefaultButton(title: "Ja") {
            print("You canceled the car dialog.")
        }
        
        // This button will not the dismiss the dialog
        let buttonTwo = DefaultButton(title: "Nee") {
            print("What a beauty!")
        }
        
        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
    func findCurrentTheme() {
        for card in cardsArray {
            if (card.title == selectedCard) {
                currentTheme = card.theme
                if (currentTheme?.lowercased() == Constants.themeD.lowercased()) {
                    cardToolbar.barTintColor = Constants.purpleblue
                    navigationController?.navigationBar.tintColor = UIColor.white
                } else if (currentTheme?.lowercased() == Constants.themeC.lowercased()) {
                    cardToolbar.barTintColor = Constants.yellow
                    navigationController?.navigationBar.tintColor = Constants.purpleblue
                } else if (currentTheme?.lowercased() == Constants.themeP.lowercased()) {
                    cardToolbar.barTintColor = Constants.lightblue
                    navigationController?.navigationBar.tintColor = UIColor.white
                }
            }
        }
    }

    @IBAction func startbekwaamButton(_ sender: Any) {
        setStartbekwaamCardText()
    }
    
    @IBAction func bekwaamButton(_ sender: Any) {
        setBekwaamCardText()
    }
    
    func setStartbekwaamCardText() {
        navigationItem.title = Constants.levelS
        if (currentTheme?.lowercased() == Constants.themeD.lowercased()) {
            bekwaamButton.tintColor = UIColor.white
            startbekwaamButton.tintColor = UIColor.white.withAlphaComponent(0.6)
        } else if (currentTheme?.lowercased() == Constants.themeC.lowercased()) {
            bekwaamButton.tintColor = Constants.purpleblue
            startbekwaamButton.tintColor = Constants.purpleblue.withAlphaComponent(0.6)
        } else if (currentTheme?.lowercased() == Constants.themeP.lowercased()) {
            bekwaamButton.tintColor = UIColor.white
            startbekwaamButton.tintColor = UIColor.white.withAlphaComponent(0.6)
        }
        for card in cardsArray {
            if (card.title == selectedCard && card.level.lowercased() == Constants.levelS.lowercased()) {
                resultTextView.text = card.resultText
                deLeraarTextView.text = card.teacherText.replacingOccurrences(of: "#", with: "\n∙").replacingOccurrences(of: "$", with: "∙")
                reflectievragenTextView.text = card.questionText.replacingOccurrences(of: "#", with: "\n∙").replacingOccurrences(of: "$", with: "∙")
            }
        }
    }
    
    func setBekwaamCardText() {
        navigationItem.title = Constants.levelB
        if (currentTheme?.lowercased() == Constants.themeD.lowercased()) {
            bekwaamButton.tintColor = UIColor.white.withAlphaComponent(0.6)
            startbekwaamButton.tintColor = UIColor.white
        } else if (currentTheme?.lowercased() == Constants.themeC.lowercased()) {
            bekwaamButton.tintColor = Constants.purpleblue.withAlphaComponent(0.6)
            startbekwaamButton.tintColor = Constants.purpleblue
        } else if (currentTheme?.lowercased() == Constants.themeP.lowercased()) {
            bekwaamButton.tintColor = UIColor.white.withAlphaComponent(0.6)
            startbekwaamButton.tintColor = UIColor.white
        }
        for card in cardsArray {
            if (card.title == selectedCard && card.level.lowercased() == Constants.levelB.lowercased()) {
                resultTextView.text = card.resultText
                deLeraarTextView.text = card.teacherText.replacingOccurrences(of: "#", with: "\n∙").replacingOccurrences(of: "$", with: "∙")
                reflectievragenTextView.text = card.questionText.replacingOccurrences(of: "#", with: "\n∙").replacingOccurrences(of: "$", with: "∙")
            }
        }
    
    }
    
    func setupReferences() {
        dialoguecardRef = Constants.getRootRef()
        checkcardRef = Constants.getCheckRef()
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
            self.findCurrentTheme()
        })
    }
}
