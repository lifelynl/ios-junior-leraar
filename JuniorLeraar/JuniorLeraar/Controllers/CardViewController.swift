//
//  CardViewController.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 07-03-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var deLeraarTextView: UITextView!
    @IBOutlet weak var reflectievragenTextView: UITextView!
    
    @IBOutlet weak var bekwaamButton: UIBarButtonItem!
    @IBOutlet weak var startbekwaamButton: UIBarButtonItem!
    @IBOutlet weak var cardToolbar: UIToolbar!
    var cardsArray = [Kaart]()
    var selectedCard = ""
    var currentTheme: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCardsArray()
        setupStyling()
    }
    
    func setupStyling() {
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
    }
    
    func findCurrentTheme() {
        for card in cardsArray {
            if (card.title == selectedCard) {
                currentTheme = card.theme
                if (currentTheme?.lowercased() == Constants.themeD.lowercased()) {
                    cardToolbar.barTintColor = Constants.purpleblue
                } else if (currentTheme?.lowercased() == Constants.themeC.lowercased()) {
                    cardToolbar.barTintColor = Constants.yellow
                } else if (currentTheme?.lowercased() == Constants.themeP.lowercased()) {
                    cardToolbar.barTintColor = Constants.lightblue
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
                deLeraarTextView.text = card.teacherText.replacingOccurrences(of: " #", with: "\n∙").replacingOccurrences(of: "$", with: "∙")
                reflectievragenTextView.text = card.questionText.replacingOccurrences(of: " #", with: "\n∙").replacingOccurrences(of: "$", with: "∙")
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
                deLeraarTextView.text = card.teacherText.replacingOccurrences(of: " #", with: "\n∙").replacingOccurrences(of: "$", with: "∙")
                reflectievragenTextView.text = card.questionText.replacingOccurrences(of: " #", with: "\n∙").replacingOccurrences(of: "$", with: "∙")
            }
        }
    
    }
    
    func getCardsArray() {
        cardsArray = JsonController.parseJson()
        self.setStartbekwaamCardText()
        self.findCurrentTheme()
    }
}
