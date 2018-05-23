//
//  JsonViewController.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 23-04-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit

struct JsonController{
    
    static func parseJson() -> [Card] {
        var cardsArray = [Card]()
        let path = Bundle.main.path(forResource: "cards", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            cardsArray = try decoder.decode([Card].self, from: data)
        } catch let jsonErr {
            print("Failed to decode:", jsonErr)
        }
        return cardsArray
    }
    
    //    struct Root : Decodable {
//        private enum CodingKeys : String, CodingKey { case kaart = "Dialoguecard" }
//        let kaart : Kaart
//    }

}
