//
//  ProfileView.swift
//  GMart
//
//  Created by Gowrisankar Samy on 19/11/24.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    var user: User
    var body: some View {
        //if let user = viewModel.currentUser {
       

            List{
                Section{
                    HStack{
                        Text("GK")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.white))
                            .frame(width: 72,height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(.circle)
                        VStack (alignment: .leading , spacing: 4) {
                            Text( User.Mock_user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(User.Mock_user.email)
                                .font(.footnote)
                                .accentColor(.gray)
                            Text("Pass Member")
                                .font(.footnote)
                                .accentColor(.gray)
                        }
                    }
                }
               // .background(Color(.systemBlue))
                //.foregroundColor(Color.yellow)
                
                Section("Order Status"){
                    Button {
                        print("Orders")
                    } label: {
                        SettingsRowView(imageName: "handbag.fill",
                                        title: "Orders",
                                        tineColor: .black )
                    }
                }
                Section("General"){
                    
                    Button {
                        print("Profile")
                    } label: {
                        SettingsRowView(imageName: "person.crop.circle",
                                        title: "Profile",
                                        tineColor: .black )
                    }
                    Button {
                        print("Addresses")
                    } label: {
                        SettingsRowView(imageName: "house.fill",
                                        title: "Addresses",
                                        tineColor: .black )
                    }
                    Button {
                        print("Rewards")
                    } label: {
                        SettingsRowView(imageName: "gift.fill",
                                        title: "Rewards",
                                        tineColor: .black )
                    }
                    
                }
                Section("Support"){
                    HStack{
                        SettingsRowView(imageName: "gear",
                                        title: "App Version",
                                        tineColor: Color(.systemGray))
                        Spacer()
                        Text("24.11.1")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Button {
                        print("Terms & Condition & Policy")
                    } label: {
                        SettingsRowView(imageName: "note.text",
                                        title: "Terms & Condition & Policy",
                                        tineColor: .black )
                    }
                    //Customer Support
                    Button {
                        print("Customer Support")
                    } label: {
                        SettingsRowView(imageName: "message.badge.waveform",
                                        title: "Customer Support & FAQs",
                                        tineColor: .black )
                    }
                }
                Section("Account"){
                    Button {
                        print("Notification Setings")
                    } label: {
                        SettingsRowView(imageName: "bell.slash.circle.fill",
                                        title: "Notification Setings",
                                        tineColor: .black )
                    }
                    Button {
                        print("Delete Account")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill",
                                        title: "Delete Account",
                                        tineColor: .red )
                    }
                    Button {
                        Task{
                            viewModel.signOut()
                        }
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill",
                                        title: "Sign Out",
                                        tineColor: .red )
                    }
                    
                  
                }
            }
       // }
    }
}

#Preview {
    ProfileView(user: User(id: "1233", fullname: "Gowri", email: "gowrisankar"))
}
