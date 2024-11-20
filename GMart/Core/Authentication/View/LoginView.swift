//
//  LoginView.swift
//  GMart
//
//  Created by Gowrisankar Samy on 19/11/24.
//

import SwiftUI

struct LoginView: View {
    @State private  var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack {
            VStack {
                //Logo
                Image("appLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 200)
                    .padding(.vertical,32)
                
                // Form Fields
                VStack (spacing: 24){
                    InputView(text: $email,
                              title: "Email Address",
                              placeHolder: "name@example.com")
                    .autocapitalization(.none)
                    InputView(text: $password,
                              title: "Password",
                              placeHolder: "Enter Your Password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top,12)
                
                //forgot
                NavigationLink {
                    ForgotPasswordView()
                }label: {
                    HStack(spacing: 3){
                        Text("Forgot Password?")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
                
                
                //sign in
                Button {
                    print("Login User in..")
                    Task{
                        try await viewModel.signIn(withEmail: email, Password: password)
                    }
                    
                } label: {
                    HStack{
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top,24)
                
                
                Spacer()
                
                //Sign Up
                
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                }label: {
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        Text("SIGN UP")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
                
                
                
                
                
            }
        }
    }
}

// MARK:- field Validation

extension LoginView: AuthenticationFormProtocal {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && email.contains(".")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
