//
//  SingleNotification.swift
//  LittleLemonFoodOrderingApp
//
//  Created by Abdirahman Abdisalam on 27/05/23.
//

import Foundation

class SingleNotification: ObservableObject, Identifiable, Equatable, NSCopying {
    let id = UUID()
    @Published var name: Notification
    @Published var isOn: Bool
    
    init(_ name: Notification, _ isOn: Bool) {
        self.name = name
        self.isOn = isOn
    }
    
    static func ==(lhs: SingleNotification, rhs: SingleNotification) -> Bool {
        return lhs.name == rhs.name
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = SingleNotification(name, isOn)
        return copy
    }
}
