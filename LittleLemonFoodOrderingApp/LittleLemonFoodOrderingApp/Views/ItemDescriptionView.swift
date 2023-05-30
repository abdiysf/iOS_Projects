//
//  ItemDescriptionView.swift
//  LittleLemonFoodOrderingApp
//
//  Created by Abdirahman Abdisalam on 23/05/23.
//

import SwiftUI

struct ItemDescriptionView: View {
    let title: String
    let description: String
    let price: String
    let image: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(Font.custom("MarkaziText-Bold", size: 60))
            AsyncImage(url: URL(string: image)) { image in image.resizable()
            }placeholder: {
                ProgressView()
            }
            .frame(width: 250, height: 250)
            .border(.gray)
            
            Text("$\(price).00")
                .font(Font.custom("Karla-Regular_Medium", size: 40))
            
            Text(description)
                .font(Font.custom("Karla-Regular_Medium", size: 20))
            
        }
        .padding()
    }
}

struct ItemDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDescriptionView(title: "Bruschetta", description: "Oven-baked bruschetta stuffed with tomatos and herbs.", price: "10", image: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/bruschetta.jpg?raw=true")
    }
}
