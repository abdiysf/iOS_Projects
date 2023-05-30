//
//  MenuItemView.swift
//  LittleLemonFoodOrderingApp
//
//  Created by Abdirahman Abdisalam on 24/05/23.
//

import SwiftUI

struct MenuItemView: View {
    
    let dish: Dish
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(dish.title ?? "title")")
                .bold()
            HStack {
                VStack(alignment: .leading) {
                    Text("\(dish.itemDescription ?? "Description")")
                        .font(.footnote)
                        .lineLimit(2)
                        .padding(.bottom, 5)
                    Text(Int(dish.price ?? "Description")!, format: .currency(code: "USD"))
                }
                Spacer()
                AsyncImage(url: URL(string: dish.image ?? "image")) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                        
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
            }
        }
    }
}
