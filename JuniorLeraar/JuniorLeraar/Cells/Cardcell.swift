//
//  Cardcell.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 21-02-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit

class Cardcell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    
    func setCardCell(card: Card) {
        titleLable.text = card.title
        themeLabel.text = card.theme
    }
}
