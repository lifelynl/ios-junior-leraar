//
//  ComptenceTableViewController.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 15-02-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Foundation

class CompetenceTableViewController: UITableViewController {

    @IBOutlet weak var knopje: UIButton!
    @IBOutlet weak var cellLabel: UILabel!
    private var dialoguecardRef: DatabaseReference?
    var arraytje = ["Motiveren en inspireren van leerlingen", "Orientatie op de leerstof", "Betrekken van alle leerlingen bij de les", "Instructie leerstof en opdrachten"]
    var cardsArray = [Card]()
    var startbekwaamCards = [Card]()
    
    @IBAction func knopjeklikken(_ sender: Any) {
        print(cardsArray.count)
        for item in cardsArray {
            print(item.title)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupReferences()
        setupStyling()
        tableView.dataSource = self
        print("jasperrrrrrrr")
    }

    func setupStyling() {
        
        navigationItem.title = "Didactisch Bekwaam"
    }
    
    func setupReferences() {
        Database.database().isPersistenceEnabled = true
        dialoguecardRef = Database.database().reference(withPath: "Dialoguecard")
        observeCards()
    }
    
    func observeCards() {
        dialoguecardRef?.observe(.value, with: { snapshot in
            for item in snapshot.children {
                if let cardSnapshot = item as? DataSnapshot {
                    let card = Card(snapshot: cardSnapshot)
                    self.cardsArray.append(card)
                    print(self.cardsArray.count)
                }
            }
            self.getCards()
            self.tableView.reloadData()
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func getCards() {
        var count = 0
        for card in cardsArray {
            if (card.level.lowercased() == "startbekwaam") {
                startbekwaamCards.append(card)
                count = count + 1
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var count = 0
//        for card in cardsArray {
//            if (card.level.lowercased() == "startbekwaam") {
//                count = count + 1
//            }
//        }
        return startbekwaamCards.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        let card = startbekwaamCards[indexPath.row]
        print(card.level)
        print(card.title)
        if (card.level.lowercased() == "startbekwaam") {
            cell.textLabel?.text = card.title
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedProduct = filteredProductsArray[indexPath.row]
        performSegue(withIdentifier: "openCompetenceCard", sender: self)
    }
}
