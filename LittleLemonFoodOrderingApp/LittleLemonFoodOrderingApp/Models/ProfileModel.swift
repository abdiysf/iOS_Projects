//
//  ProfileModel.swift
//  LittleLemonFoodOrderingApp
//
//  Created by Abdirahman Abdisalam on 27/05/23.
//

import Foundation


let userDefaultFirstName = "kFirstName"
let userDefaultLastName = "kLastName"
let userDefaultEmail = "kEmail"
let kPhoneNumber = "kPhoneNumber"
let kUserImage = "kUserImage"
let kNotifications = "kNotifications"

let userDefaultsIsLoggedIn = "kIsLoggedIn"

enum Notification : String, CaseIterable {
    case orderStatus = "Order Status"
    case passwordChanges = "Password changes"
    case specialOffers = "Special offers"
    case newsLetter = "Newsletter"
}

struct Profile {
    static func loginUser(firstName: String, lastName: String, email: String) {
        UserDefaults.standard.set(firstName, forKey: userDefaultFirstName)
        UserDefaults.standard.set(lastName, forKey: userDefaultLastName)
        UserDefaults.standard.set(email, forKey: userDefaultEmail)
        UserDefaults.standard.set("Profile", forKey: kUserImage)
        
        UserDefaults.standard.set(true, forKey: userDefaultsIsLoggedIn)
    }

    static func changeUserData(firstName: String, lastName: String, email: String, phoneNumber: String, userImage: String) {
        UserDefaults.standard.set(firstName, forKey: userDefaultFirstName)
        UserDefaults.standard.set(lastName, forKey: userDefaultLastName)
        UserDefaults.standard.set(email, forKey: userDefaultEmail)
        UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
        UserDefaults.standard.set(userImage, forKey: kUserImage)
    }
    
    static func logOutUser() {
        UserDefaults.standard.set("", forKey: kPhoneNumber)
        UserDefaults.standard.set("Profile", forKey: kUserImage)
    
        for notification in Notification.allCases {
            UserDefaults.standard.set(false, forKey: notification.rawValue)
        }
        UserDefaults.standard.set(false, forKey: userDefaultsIsLoggedIn)
    }
}


