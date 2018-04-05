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
    
    @IBOutlet var buttontje: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didactischBekwaamButton.backgroundColor = Constants.purpleblue
        didactischBekwaamButton.tintColor = UIColor.white
        collegialeSamenwerkingButton.backgroundColor = Constants.yellow
        collegialeSamenwerkingButton.tintColor = Constants.purpleblue
        pedagogischBekwaamButton.backgroundColor = Constants.lightblue
        pedagogischBekwaamButton.tintColor = UIColor.white
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        didTapSearch()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    /*
     * For triggering the search functionality
     */
    func didTapSearch() {
        let searchViewController = storyboard?.instantiateViewController(withIdentifier: "searchViewController")
        let navigationController = UINavigationController(rootViewController: searchViewController!)
        navigationController.setViewControllers([searchViewController!], animated: false)
        navigationController.modalTransitionStyle = .crossDissolve
        navigationController.modalPresentationStyle = .overCurrentContext
        self.present(navigationController, animated: true, completion: nil)
    }

}

