//
//  ForgotPasswordView.swift
//  GMart
//
//  Created by Gowrisankar Samy on 20/11/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""
    @State private var isEmailSent: Bool =  false
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            Text("Reset Password")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Enter the email associate with your account and we will send an email with instruction to reset your password")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.bottom , 15)
        
        VStack (alignment: .leading, spacing: 20){
            
            InputView(text: $email, title: "", placeHolder: "Enter Your Email")
                .padding(.bottom,5)
            
            Button {
                print("Forgot clicked")
                Task{
                    
                   
                    
                    do {
                        try await viewModel.resetPassword(withEmail: email)
                        isEmailSent = true
                    } catch {
                        print("DEBUG: Error returns \(error.localizedDescription)")
                    }
                }
                
            } label: {
                HStack{
                    Text("Send Instruction")
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
            //.padding(.top,24)
            
            
            Spacer()
        }
        .padding()
        .toolbarRole(.editor)
        .navigationDestination(isPresented: $isEmailSent){
            EmailSentView()
                .navigationBarBackButtonHidden(true)
                 
        }
        
        .onAppear(){
            email = ""
        }
    }
}

// MARK:- field Validation

extension ForgotPasswordView: AuthenticationFormProtocal {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && email.contains(".")
    }
}

#Preview {
    ForgotPasswordView()
}
