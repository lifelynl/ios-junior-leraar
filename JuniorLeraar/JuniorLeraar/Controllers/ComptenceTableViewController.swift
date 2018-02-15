//
//  ComptenceTableViewController.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 15-02-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit

class ComptenceTableViewController: UITableViewController {

    @IBOutlet weak var cellLabel: UILabel!
    var arraytje = ["Motiveren en inspireren van leerlingen", "Orientatie op de leerstof", "Betrekken van alle leerlingen bij de les", "Instructie leerstof en opdrachten"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        cellLabel.text = arraytje[1]
        tableView.reloadData()
        tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arraytje.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        cell.textLabel?.text = arraytje[indexPath.row]
        return cell
    }
}
