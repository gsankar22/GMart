//
//  ContentView.swift
//  GMart
//
//  Created by Gowrisankar Samy on 19/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @EnvironmentObject  var viewModel: AuthViewModel

    var body: some View {
        Group {
            if viewModel.userSession != nil{
                ProfileView( user: User(id: "test", fullname: "Gowri", email: "Gowri@gmail.com"))
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
