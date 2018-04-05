//
//  SearchCell.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 05-04-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    
    
    @IBOutlet weak var searchLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setSearchCell(card: Card) {
        searchLabel.text = card.title
    }
    
}
