//
//  UserProfileView.swift
//  LittleLemonFoodOrderingApp
//
//  Created by Abdirahman Abdisalam on 23/05/23.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.presentationMode) var presentation
    @State private var firstName = UserDefaults.standard.string(forKey: userDefaultFirstName) ?? ""
    @State private var lastName = UserDefaults.standard.string(forKey: userDefaultLastName) ?? ""
    @State private var email = UserDefaults.standard.string(forKey: userDefaultEmail) ?? ""
    @State private var phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
    let isLoggedIn: Bool? = UserDefaults.standard.bool(forKey: userDefaultsIsLoggedIn)
    
    @State private var userImage = UserDefaults.standard.string(forKey: kUserImage) ?? "Profile"
    
    @StateObject private var notification = Notifications()
    
    var body: some View {
        VStack {
            Text("Personal Information")
                .font(Font.custom("Karla-Regular_ExtraBold", size: 25))
            
            HStack(spacing: 5) {
                Image(userImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 80)
                    .frame(height: 80)
                    .padding([.leading], -25)
                Button {
                    userImage = "Profile"
                }label: {
                    Text("Change")
                        .padding()
                        .frame(height: 40)
                        .frame(width: 100)
                        .background(Color("PrimaryGreen"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .disabled(userImage != "")
                Button {
                    userImage = ""
                }label: {
                    Text("Remove")
                        .padding()
                        .frame(height: 40)
                        .frame(width: 100)
                        .border(Color("PrimaryGreen"))
                        .foregroundColor(Color("PrimaryGreen"))
                        .font(.headline)
                }
                
            }
            VStack {
                VStack {
                    Text("First Name *")
                        .foregroundColor(Color.black.opacity(0.6))
                        .fontWeight(Font.Weight.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.bottom], -5)
                    TextField("First Name", text: $firstName)
                        .padding(12)
                    //                        .background(Color.gray.opacity(0.2) .border(Color.blue))
                        .font(.headline)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1.0))
                    
                    Text("Last Name *")
                        .foregroundColor(Color.black.opacity(0.6))
                        .fontWeight(Font.Weight.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.bottom], -5 )
                    TextField("Last Name", text: $lastName)
                        .padding(12)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1.0))
                        .font(.headline)
                    
                    Text("Last Name *")
                        .foregroundColor(Color.black.opacity(0.6))
                        .fontWeight(Font.Weight.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.bottom], -5 )
                    TextField("Email", text: $email)
                        .padding(12)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1.0))
                        .font(.headline)
                    
                    Text("Phone Number *")
                        .foregroundColor(Color.black.opacity(0.6))
                        .fontWeight(Font.Weight.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding([.bottom], -5)
                    TextField("Phone Number", text: $phoneNumber)
                        .padding(10)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1.0))
                        .font(.headline)
                    
                }
                .padding(.horizontal)
//                padding([.leading, .trailing], 10)
            }
            
            VStack(alignment: .leading, spacing: 8.0) {
                Section("Email notifications") {
                    ForEach(notification.notifications) { item in
                        Button {
                            let newNotification = SingleNotification(item.name, !item.isOn)
                            notification.update(notification: newNotification)
                        } label: {
                            Label(item.name.rawValue, systemImage: item.isOn ? "checkmark.square.fill" : "square")
                        }
                        .listRowSeparator(.hidden)
                    }
                    .foregroundColor(.black)
                }
                .padding([.leading] , -165)
            }
            
            
         .scrollContentBackground(.hidden)
            Button {
                Profile.logOutUser()
                self.presentation.wrappedValue.dismiss()
            } label: {
                HStack {
                    Spacer()
                    Text("Log out")
                    Spacer()
                }
                .padding()
                .background(.yellow)
                .foregroundColor(.black)
                .bold()
                .cornerRadius(8)
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            HStack(spacing: 15) {
                Button {
                    firstName = UserDefaults.standard.string(forKey: userDefaultFirstName) ?? ""
                    lastName = UserDefaults.standard.string(forKey: userDefaultLastName) ?? ""
                    email = UserDefaults.standard.string(forKey: userDefaultEmail) ?? ""
                    phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
                    notification.reset()
                } label: {
                    Text("Discard changes")
                        .padding()
                        .foregroundColor(Color("PrimaryGreen"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color("PrimaryGreen"), lineWidth: 1)
                        )
                        .frame(height: 35)
                        
                }
                Button {
                    Profile.changeUserData(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, userImage: userImage)
                    notification.save()
                } label: {
                    Text("Save change")
                        .padding()
                        .background(Color("PrimaryGreen"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .frame(height: 35)
                }
            }
            Spacer(minLength: 10)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
