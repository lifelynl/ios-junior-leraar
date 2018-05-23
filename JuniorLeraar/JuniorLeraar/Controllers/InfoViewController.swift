//
//  InfoModalViewController.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 20-03-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var versionTextView: UITextView!
    @IBOutlet weak var infoTextview: UITextView!
    
    override func viewDidLoad() {
        setupStyling()
    }
    
    func setupStyling() {
        navigationItem.title = Constants.infoTitle
        navigationController?.navigationBar.barTintColor = Constants.purpleblue
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        versionTextView.text = Constants.version
        infoTextview.accessibilityTraits = UIAccessibilityTraitStaticText
    }

}
