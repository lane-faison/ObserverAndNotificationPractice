//
//  SelectionScreen.swift
//  ObserverAndNotificatinPractice
//
//  Created by Lane Faison on 7/30/17.
//  Copyright © 2017 Lane Faison. All rights reserved.
//

import UIKit

class SelectionScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Started")
    }

    @IBAction func yankeesBtnTapped(_ sender: Any) {
        
        let name = Notification.Name(rawValue: yankeesNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func redsoxBtnTapped(_ sender: Any) {
        let name = Notification.Name(rawValue: redsoxNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
}
