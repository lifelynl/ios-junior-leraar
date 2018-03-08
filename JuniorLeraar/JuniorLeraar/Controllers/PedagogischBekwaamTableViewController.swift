//
//  PedagogischBekwaamTableViewController.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 08-03-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PedagogischBekwaamTableViewController: UITableViewController {
    
    private var dialoguecardRef: DatabaseReference?
    var cardsArray = [Card]()
    var startbekwaamCards = [Card]()
    var selectedCard: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupReferences()
        setupStyling()
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = Constants.lightblue20
    }
    
    func setupStyling() {
        navigationItem.title = "Pedagogisch Bekwaam"
        navigationController?.navigationBar.barTintColor = Constants.lightblue
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
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
            self.getCards()
        })
    }
    
    func getCards() {
        var count = 0
        for card in cardsArray {
            if (card.level.lowercased() == "startbekwaam" && card.theme.lowercased() == "pedagogisch bekwaam") {
                startbekwaamCards.append(card)
                count = count + 1
            }
        }
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return startbekwaamCards.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = startbekwaamCards[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCard = startbekwaamCards[indexPath.row].title
        performSegue(withIdentifier: "openCompetenceCardPedagogischBekwaam", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "openCompetenceCardPedagogischBekwaam") {
            let yourNextViewController = segue.destination as! CardViewController
            yourNextViewController.selectedCard = selectedCard
        }
    }
}

