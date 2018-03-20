//
//  ViewController.swift
//  JuniorLeraar
//
//  Created by Jasper Zwiers on 15-02-18.
//  Copyright © 2018 Jasper Zwiers. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var didactischBekwaamButton: UIButton!
    @IBOutlet weak var collegialeSamenwerkingButton: UIButton!
    @IBOutlet weak var pedagogischBekwaamButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didactischBekwaamButton.backgroundColor = Constants.purpleblue
        didactischBekwaamButton.tintColor = UIColor.white
        collegialeSamenwerkingButton.backgroundColor = Constants.yellow
        collegialeSamenwerkingButton.tintColor = Constants.purpleblue
        pedagogischBekwaamButton.backgroundColor = Constants.lightblue
        pedagogischBekwaamButton.tintColor = UIColor.white
        if let text = Bundle.main.infoDictionary?["CFBundleVersion"]  as? String {
            print(text + "🇭🇷")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

