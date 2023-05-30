//
//  Notifications.swift
//  LittleLemonFoodOrderingApp
//
//  Created by Abdirahman Abdisalam on 27/05/23.
//

import Foundation

@MainActor class Notifications: ObservableObject {
    @Published private(set)var notifications =  [SingleNotification]()
    
    private(set) var initialState: [SingleNotification]
    
    init() {
        var tempNotifications = [SingleNotification]()
        for notification in Notification.allCases {
            let isOn = UserDefaults.standard.bool(forKey: notification.rawValue)
            let valueToAppend: SingleNotification = SingleNotification(notification, isOn)
            tempNotifications.append(valueToAppend)
        }
        self.notifications = tempNotifications
        // need to copy since we don't want to have the same reference
        self.initialState = tempNotifications.map {
            $0.copy() as! SingleNotification
        }
    }
    
    func update(notification: SingleNotification) {
        if let index = notifications.firstIndex(of: notification) {
            notifications[index] = notification
        }
    }
    
    func reset() {
        self.notifications = self.initialState.map {
            $0.copy() as! SingleNotification
        }
    }
    
    func save() {
        // save changes to user defaults and set new initial state
        for notification in self.notifications {
            UserDefaults.standard.set(notification.isOn, forKey: notification.name.rawValue)
        }
        self.initialState = self.notifications.map {
            $0.copy() as! SingleNotification
        }
    }
}
