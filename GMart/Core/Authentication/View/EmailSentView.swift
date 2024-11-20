//
//  EmailSentView.swift
//  GMart
//
//  Created by Gowrisankar Samy on 20/11/24.
//

import SwiftUI

struct EmailSentView: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
       
        VStack(spacing: 30){
            //logo
            Image(systemName: "envelope.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.blue)
            
            //title
            VStack (spacing: 8){
                Text("Check your email")
                    .font(.largeTitle.bold())
                Text("We have sent a password recover instruction to your email.")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            
            //button
            Button {
                print("Skip i will confirm later")
               
            } label: {
                HStack{
                    Text("Skip, I'll confirm later")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            
            //footer
            
            Spacer()
            
            Button {
                print("DEBUG -- try another email")
                dismiss()
            } label: {
                HStack{
                    Text("Did not receive the email? check yyour spam filter, or ")
                        .foregroundColor(.gray)
                    +
                    Text("try anothe email address")
                        .foregroundColor(.blue)
                }
            }

           
            
        }
        .padding()
        .toolbarRole(.editor)
    }
}

#Preview {
    EmailSentView()
}
