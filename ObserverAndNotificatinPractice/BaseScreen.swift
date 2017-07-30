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
    
    let yankees = Notification.Name(rawValue: yankeesNotificationKey)
    let redsox = Notification.Name(rawValue: redsoxNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        chooseButton.layer.cornerRadius = chooseButton.frame.height/2
    
    
    }
    
    func createObservers() {
        // Yankees
        NotificationCenter.default.addObserver(self, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
        
        
        // Red Sox
        
        
        
    }
    
    func updateTeamImage(notification: NSNotification) {
        
    }
    
    func updateNameLabel(notification: NSNotification) {
        
    }
    

    @IBAction func chooseButtonTapped(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        present(selectionVC, animated: true, completion: nil)
    }
}

