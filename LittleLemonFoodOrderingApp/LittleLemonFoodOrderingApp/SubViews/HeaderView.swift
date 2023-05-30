//
//  HeroView.swift
//  LittleLemonFoodOrderingApp
//
//  Created by Abdirahman Abdisalam on 24/05/23.
//

import SwiftUI

struct HeaderView: View {
    
    let showProfileImage: Bool
    
    
    var body: some View {
        HStack {
            Spacer()
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .frame(width: 200)
            Spacer()
            if showProfileImage {
                Image("Profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .frame(height: 50)
            }
        }
        .padding()
        .frame(height: 50)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showProfileImage: true)
    }
}
