//
//  ViewController.swift
//  Alerts
//
//  Created by Evgeniy Gubin on 02.03.17.
//  Copyright © 2017 Evgeniy Gubin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let confirmDeleteFile = Alert<ConfirmOptions>(title: "Delete file", message: "Are you sure?")
        present(alert: confirmDeleteFile) { (result) in
            print(result)
        }
//        present(alert: CustomAlert.self) { (result) in
//            print(result)
//        }
    }
}
