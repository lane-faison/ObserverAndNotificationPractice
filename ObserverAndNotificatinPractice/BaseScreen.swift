//
//  BaseScreen.swift
//  ObserverAndNotificatinPractice
//
//  Created by Lane Faison on 7/30/17.
//  Copyright © 2017 Lane Faison. All rights reserved.
//

import UIKit

let yankeesNotificationKey = "co.lanefasion.yankees"
let redsoxNotificationKey = "co.lanefaison.redsox"

class BaseScreen: UIViewController {

    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var choiceImage: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    let yankees = Notification.Name(rawValue: yankeesNotificationKey)
    let redsox = Notification.Name(rawValue: redsoxNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        chooseButton.layer.cornerRadius = chooseButton.frame.height/2
        createObservers()
    
    }
    
    func createObservers() {
        // Yankees
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateTeamImage(notification:)), name: yankees, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateNameLabel(notification:)), name: yankees, object: nil)
        
        // Red Sox
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateTeamImage(notification:)), name: redsox, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateNameLabel(notification:)), name: redsox, object: nil)
        
        
    }
    
    func updateTeamImage(notification: NSNotification) {
        let isYankees = notification.name == yankees
        let image = isYankees ? UIImage(named: "yankees")! : UIImage(named: "redsox")!
        choiceImage.image = image
    }
    
    func updateNameLabel(notification: NSNotification) {        
        let isYankees = notification.name == yankees
        let name = isYankees ? "New York Yankees" : "Boston Red Sox"
        teamNameLabel.text = name

    }
    

    @IBAction func chooseButtonTapped(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        present(selectionVC, animated: true, completion: nil)
    }
}

