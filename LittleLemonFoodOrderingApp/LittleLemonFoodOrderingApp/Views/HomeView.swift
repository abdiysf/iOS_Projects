//
//  HomeView.swift
//  LittleLemonFoodOrderingApp
//
//  Created by Abdirahman Abdisalam on 23/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        
        TabView {
            MenuView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .tabItem {
                    Text("Menu")
                    Image(systemName: "list.dash")
                }
            UserProfileView()
                .tabItem {
                    Text("Profile")
                    Image(systemName: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden(true)
        .accentColor(colorScheme == .dark ? Color("PrimaryYellow") : Color("PrimaryGreen"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
