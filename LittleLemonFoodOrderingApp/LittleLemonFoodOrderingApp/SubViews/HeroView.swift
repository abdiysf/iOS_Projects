//
//  HeroView.swift
//  LittleLemonFoodOrderingApp
//
//  Created by Abdirahman Abdisalam on 22/05/23.
//

import SwiftUI

struct HeroView: View {
    
    @Binding var searchText: String
    var showSearchBar = true
    
    var body: some View {  
            VStack(alignment: .leading, spacing: 0) {
                Text("Little Lemon")
                    .font(Font.custom("MarkaziText-SemiBold", size: 55, relativeTo: .largeTitle))
                    .foregroundColor(Color("PrimaryYellow"))
                Text("Chicago")
                    .font(Font.custom("MarkaziText-SemiBold", size: 45, relativeTo: .title))
                    .foregroundColor(Color("HighlightGray"))
                    .padding(.bottom, -60)
                
                    HStack {
                        Text("We are a family owned Mediterranean, restuarant, focused on trditional recipes served with a modern twist.")
                            .font(Font.custom("Karla", size: 16))
                            .foregroundColor(Color("HighlightGray"))
                            .multilineTextAlignment(.leading)
                        
                        Image("Hero image")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 175)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                    }
                    
                    //                padding(.top, 5)
                    if showSearchBar {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .padding([.leading], 10)
                            TextField("Search Menu", text: $searchText)
                                .padding(8)
                        }
                        .background(Capsule().fill(Color.white.opacity(0.9)))
                    
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("PrimaryGreen"))
        }
 
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(searchText: .constant(""))
    }
}
