//
//  Kaart.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 01-05-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import Foundation

struct Kaart: Decodable {
    let competence: String
    let level: String
    let theme: String
    let title: String
    let teacherText: String
    let resultText: String
    let questionText: String
}
