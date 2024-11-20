//
//  RegistrationView.swift
//  GMart
//
//  Created by Gowrisankar Samy on 19/11/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private  var password = ""
    @State private var fullname = ""
    @State private  var confirmpassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack{
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
                InputView(text: $fullname,
                          title: "Full Name",
                          placeHolder: "Enter Your Name")
                .autocapitalization(.none)
                InputView(text: $password,
                          title: "Password",
                          placeHolder: "Enter Your Password",
                          isSecureField: true)
                
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmpassword,
                              title: "Confirm Password",
                              placeHolder: "Confirm Your Password",
                              isSecureField: true)
                    if !password.isEmpty && !confirmpassword.isEmpty {
                        if password == confirmpassword {
                            Image (systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image (systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                        
                    }
                }
                
                
            }
            .padding(.horizontal)
            .padding(.top,12)
            
            Button {
                Task{
                    try await viewModel.createUser(withEmail: email,
                                                   Password: password,
                                                   fullName: fullname)
                }
                
            } label: {
                HStack{
                    Text("SIGN UP")
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
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3){
                    Text("Already have an account?")
                    Text("SIGN IN")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
            
        }
    }
}

// MARK:- field Validation

extension RegistrationView: AuthenticationFormProtocal {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && email.contains(".")
        && !password.isEmpty
        && password.count > 5
        && confirmpassword == password
        && !fullname.isEmpty
        && fullname.count > 2
    }
}

#Preview {
    RegistrationView()
}
