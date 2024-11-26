//
//  ProfileUpdateView.swift
//  GMart
//
//  Created by Gowrisankar Samy on 25/11/24.
//

import SwiftUI

struct ProfileUpdateView: View {
    @State  var name: String
    @State  var phoneNumber: String
    @State  var email: String
    
    var body: some View {
        //name
        Text("profile")
        
        VStack (spacing: 24){
            //Text("Full Name")
            InputView(text: $name,
                      title: "Name *",
                      placeHolder: "Enter Your Name")
            .autocapitalization(.none)
            // Text("Phone Number")
            InputView(text: $phoneNumber,
                      title: "Phone Number *",
                      placeHolder: "Enter Your Phone Number")
            VStack(alignment: .leading){
                InputView(text: $email,
                          title: "Email Address *",
                          placeHolder: "name@example.com")
                .autocapitalization(.none)
                Text("We promise not to spam you")
                   // .padding(.leading,-100 )
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.horizontal)
        .padding(.top,100)
        
        //submit
        
        Button {
            print("Submit..")
        } label: {
            HStack{
                Text("Submit")
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .background(Color(.systemBlue))
        //.disabled(!formIsValid)
        //.opacity(formIsValid ? 1.0 : 0.5)
        .cornerRadius(10)
        .padding(.top,24)
        
        
        Divider()
        List{
            Section("General"){
                
                Button {
                    print("Delete Account")
                } label: {
                    SettingsRowView(imageName: "xmark.circle.fill",
                                    title: "Delete Account",
                                    tineColor: .red )
                }
                Text("Deleting your Account will remove all your orders, rewards and other details")
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        
        Spacer()
        
    }
}


// MARK:- field Validation

extension ProfileUpdateView: AuthenticationFormProtocal {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && email.contains(".")
        && !phoneNumber.isEmpty
        && phoneNumber.count > 10
        && !name.isEmpty
        && name.count > 2
        
    }
}

#Preview {
    ProfileUpdateView(name:"Gowrisankar", phoneNumber: "1234567890",email: "name@example.com")
}
