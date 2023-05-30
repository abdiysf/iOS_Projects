//
//  ContentView.swift
//  LittleLemonFoodOrderingApp
//
//  Created by Abdirahman Abdisalam on 22/05/23.
//
//let userDefaultFirstName: String = "first name key"
//let userDefaultLastName: String = "last name key"
//let userDefaultEmail: String = "email key"
//let userDefaultsIsLoggedIn: String = "bool key"

import SwiftUI


struct OnboardingView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var showAlert: Bool = false
    @State private var emailIsValid: Bool = true
    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                HeaderView(showProfileImage: false)
                HeroView(searchText: .constant(""), showSearchBar: false)
                
                VStack {
                    NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                        EmptyView()
                    }
                    Text("First Name *")
                        .foregroundColor(Color.black.opacity(0.6))
                        .fontWeight(Font.Weight.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                    TextField("First Name", text: $firstName)
                        .padding()
//                        .background(Color.gray.opacity(0.2) .border(Color.blue))
                        .font(.headline)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1.0))
                    
                    Text("Last Name *")
                        .foregroundColor(Color.black.opacity(0.6))
                        .fontWeight(Font.Weight.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top], 8 )
                    TextField("Last Name", text: $lastName)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1.0))
                        .font(.headline)
                    
                    Text("Last Name *")
                        .foregroundColor(Color.black.opacity(0.6))
                        .fontWeight(Font.Weight.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top], 8 )
                    TextField("Email", text: $email)
                        .padding()
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1.0))
                        .font(.headline)
                    Spacer()
                    Button {
                        validateEmail()
                    } label: {
                        Text("Register".uppercased())
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(textfieldNotEmpty() ? Color.gray : Color("PrimaryGreen"))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    .onChange(of: email) { newValue in
                        if(newValue.range(of: "^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
                            self.emailIsValid = true
                        } else {
                            self.emailIsValid = false
                        }
                    }
                    .alert("Email is invalid. Please enter valid email", isPresented: $showAlert) {
                        Button("OK", role: .cancel) {}
                    }
                    .disabled(textfieldNotEmpty())
                }
                .padding()
            }
            .onAppear() {
                if UserDefaults.standard.bool(forKey: userDefaultsIsLoggedIn) {
                    isLoggedIn = true
                }
            }
            
        }
    }

    private func setUserDefaults() {
        UserDefaults.standard.set(self.firstName, forKey: userDefaultFirstName)
        UserDefaults.standard.set(self.lastName, forKey: userDefaultLastName)
        UserDefaults.standard.set(self.email, forKey: userDefaultEmail)
        UserDefaults.standard.set(self.isLoggedIn, forKey: userDefaultsIsLoggedIn)
    }
    private func textfieldNotEmpty() -> Bool {
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
            return true
        }
        return false
    }
    private func validateEmail() {
        if !self.emailIsValid {
            showAlert = true
        } else {
            isLoggedIn = true
            setUserDefaults()
        }
    }
}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
