//
//  InfoModalViewController.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 20-03-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        navigationItem.title = "Info"
        navigationController?.navigationBar.barTintColor = Constants.purpleblue
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }

}
