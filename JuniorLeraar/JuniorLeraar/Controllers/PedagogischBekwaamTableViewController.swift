//
//  PedagogischBekwaamTableViewController.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 08-03-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit

class PedagogischBekwaamTableViewController: UITableViewController {
    
    var cardsArray = [Card]()
    var startbekwaamCards = [Card]()
    var selectedCard: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyling()
        getCardsArray()
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = Constants.lightblue20
    }
    
    func setupStyling() {
        navigationItem.title = Constants.themeP
        navigationController?.navigationBar.barTintColor = Constants.lightblue
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }
    
    func getCardsArray() {
        cardsArray = JsonController.parseJson()
        getCards()
    }
    
    func getCards() {
        var count = 0
        startbekwaamCards.removeAll()
        for card in cardsArray {
            if (card.level.lowercased() == Constants.levelS.lowercased() && card.theme.lowercased() == Constants.themeP.lowercased()) {
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
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = startbekwaamCards[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCard = startbekwaamCards[indexPath.row].title
        performSegue(withIdentifier: Constants.openCompetenceCardPB, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == Constants.openCompetenceCardPB) {
            let yourNextViewController = segue.destination as! CardViewController
            yourNextViewController.selectedCard = selectedCard
            
            let backItem = UIBarButtonItem()
            backItem.title = Constants.back
            navigationItem.backBarButtonItem = backItem
        }
    }
}

