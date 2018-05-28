//
//  SearchViewController.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 28-05-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate{
    
    var searchController = UISearchController(searchResultsController: nil)
    var tableViewController = UITableViewController()
    var filteredCardsArray = [Card]()
    var cardsArray = [Card]()
    var startbekwaamCards = [Card]()
    var selectedCard: Card?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewController.tableView.dataSource = self
        tableViewController.tableView.delegate = self
        searchController = UISearchController(searchResultsController: self.tableViewController)
        searchController.searchResultsUpdater = self
        navigationItem.titleView = searchController.searchBar
        searchController.searchBar.delegate = self
        
        setupStyling()
        observeCards()
    }
    
    /*
     Styling for page
     */
    func setupStyling() {
        searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.backgroundColor = Constants.purpleblue20
        navigationController?.navigationBar.barTintColor = Constants.purpleblue20
        let cancelButtonAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes , for: .normal)
    }
    
    /*
     Database setup
     */
    func observeCards() {
        cardsArray = JsonController.parseJson()
        getCards()
    }
    
    func getCards() {
        var count = 0
        startbekwaamCards.removeAll()
        for card in cardsArray {
            if (card.level.lowercased() == Constants.levelS.lowercased()) {
                startbekwaamCards.append(card)
                count = count + 1
            }
        }
    }
    
    /*
     Exit search when cancel is clicked
     */
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func userTappedBackground(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    /*
     Update the search results
     */
    func updateSearchResults(for searchController: UISearchController) {
        filteredCardsArray = startbekwaamCards.filter({ (card: Card) -> Bool in
            if (card.title.lowercased().contains(self.searchController.searchBar.text!.lowercased())) {
                return true
            } else {
                return false
            }
        })
        tableViewController.tableView.reloadData()
    }
    
    /*
     Return array with search results
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCardsArray.count
    }
    
    /*
     Add search results from array to cell in tableView
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchCell = UITableViewCell()
        let card = filteredCardsArray[indexPath.row]
        searchCell.textLabel?.text = card.competence
        return searchCell
    }
    
    /*
     Get selected product
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCard = filteredCardsArray[indexPath.row]
        performSegue(withIdentifier: "searchToCard", sender: self)
    }
    
    /*
     Prepare for searchToProductInfoSegue
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "searchToCard") {
            let yourNextViewController = segue.destination as! CardViewController
            yourNextViewController.selectedCard = (selectedCard?.title)!
            
            let backItem = UIBarButtonItem()
            backItem.title = Constants.back
            navigationItem.backBarButtonItem = backItem
        }
    }
}


