//
//  MenuItemModel.swift
//  LittleLemonFoodOrderingApp
//
//  Created by Abdirahman Abdisalam on 23/05/23.
//

import Foundation

struct MenuItem: Decodable {
    let title: String
    let image: String
    let price: String
    let itemDescription: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case image = "image"
        case price = "price"
        case itemDescription = "description"
        case category 
    }
}
