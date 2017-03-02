//
//  Alerts.swift
//  Alerts
//
//  Created by Evgeniy Gubin on 02.03.17.
//  Copyright © 2017 Evgeniy Gubin. All rights reserved.
//

import Foundation

enum CustomAlert: String, StaticAlertModel, AlertOption {
    typealias Option = CustomAlert
    
    case action0
    case action1
    case action2
    
    static var title: String? {
        return "Title"
    }
    
    static var message: String? {
        return "Message"
    }
    
    var optionText: String {
        return self.rawValue
    }
    
    static let all: [CustomAlert] = [.action0, .action1, .action2]
}

enum ConfirmOptions: AlertOption {
    case ok
    case cancel
    
    var optionText: String {
        switch self {
        case .ok:
            return "OK"
        case .cancel:
            return "Cancel"
        }
    }
    
    static let all: [ConfirmOptions] = [.ok, .cancel]
}
