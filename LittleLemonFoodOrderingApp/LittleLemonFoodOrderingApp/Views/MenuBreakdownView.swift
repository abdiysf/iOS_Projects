//
//  MenuBreakdownView.swift
//  LittleLemonFoodOrderingApp
//
//  Created by Abdirahman Abdisalam on 23/05/23.
//

import SwiftUI

struct MenuBreakdownView: View {
    
    @Binding var category: MenuCategory 
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Order for delivery!".capitalized)
                .font(Font.custom("Karla-Regular_Bold", size: 20) .bold())
                .padding(.leading, 10)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(MenuCategory.allCases, id: \.rawValue) {
                        category in
                        Button {
                            self.category = category
                        } label: {
                            Text("\(category.rawValue)")
                                .font(.callout)
                                .padding()
                                .padding(.horizontal)
                                .foregroundColor(.black)
                                .background(.gray.opacity(0.5))
                                .clipShape(Capsule())
                                .lineLimit(1)
                        }
                    }
                }
                .padding(.horizontal, 5)
            }
        }
    }
}

struct MenuBreakdownView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBreakdownView(category: .constant(.all))
    }
}
