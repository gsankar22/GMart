//
//  SearchLocation.swift
//  GMart
//
//  Created by Gowrisankar Samy on 25/11/24.
//

import SwiftUI

struct ChatScreen: View {
    var body: some View {
        Text("ChatScreen")
    }
}

struct SearchLocation: View {
    @State private var searchText = ""
    @State private var searchIsActive = false
       var body: some View {
           VStack(spacing: 10){
               
               NavigationStack {
               }
               .searchable(text: $searchText,
                           isPresented: $searchIsActive,
                           prompt: "Search Your Location")
              // .preferredColorScheme(.dark)
               
               HStack{
                   Image(systemName: "location.fill")
                       .font(.title)
                       .imageScale(.large)
                       .padding(.top,10)
                       
                   VStack (alignment: .leading , spacing: 4) {
                       Text("Current location")
                           .font(.headline)
                           .fontWeight(.semibold)
                           .padding(.top, 4)
                       Text("Enable your current location for better service")
                           .font(.footnote)
                           .accentColor(.gray)
                   }

                       Button {
                           print("Edit Address")
                       } label: {
                           HStack{
                               Text("Enable")
                                   .fontWeight(.medium)
                           }
                           .foregroundColor(.white)
                           .frame(width: 80, height: 40)
                       }
                       .background(Color(.systemBlue))
                       .cornerRadius(10)
                       .padding(.top,24)
               }
              // .padding()
               Spacer()
               
               
           }
       }
}

#Preview {
    SearchLocation()
}
