//
//  Alerts.swift
//  Alerts
//
//  Created by Evgeniy Gubin on 02.03.17.
//  Copyright © 2017 Evgeniy Gubin. All rights reserved.
//

import UIKit

protocol AlertOption {
    var optionText: String { get }
    
    static var all: [Self] { get }
}

protocol AlertModel {
    associatedtype Option: AlertOption
    
    var title: String? { get }
    var message: String? { get }
}

protocol StaticAlertModel {
    associatedtype Option: AlertOption
    
    static var title: String? { get }
    static var message: String? { get }
}

struct Alert<T: AlertOption>: AlertModel {
    typealias Option = T
    
    let title: String?
    let message: String?
}

extension UIViewController {
    func present<T>(alert: T, completion: @escaping (T.Option) -> Void) where T: AlertModel {
        presentAlert(title: alert.title, message: alert.message, options: T.Option.all, completion: completion)
    }
    
    func present<T>(alert: T.Type, completion: @escaping (T.Option) -> Void) where T: StaticAlertModel {
        presentAlert(title: alert.message, message: alert.message, options: T.Option.all, completion: completion)
    }
    
    private func presentAlert<T>(title: String?, message: String?, options: [T], completion: @escaping (T) -> Void) where T: AlertOption {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for option in options {
            let action = UIAlertAction(title: option.optionText, style: .default) { (action) in
                completion(option)
            }
            controller.addAction(action)
        }
        
        present(controller, animated: true, completion: nil)
    }
}
