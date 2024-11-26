//
//  AddAddressDetails.swift
//  GMart
//
//  Created by Gowrisankar Samy on 25/11/24.
//

import SwiftUI
import MapKit

struct AddAddressDetails: View {
    @State private var searchText = ""
    @State private var searchIsActive = false
    
    var body: some View {
        Text("Add Address Details")
        List{
            Section("Location"){
                Map()
                    .mapStyle(.hybrid(elevation: .realistic))
                    .frame(width: UIScreen.main.bounds.width, height: 250)
                
                VStack (alignment: .leading, spacing: 8){
                    Text("Narayana Nagar")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("BABA VILLA, Flat No: C First Floor, Plot No : 13, Second North Cross Street, Sri Kapaleeswarar Nagar, Neelangarai. Chennai - 600115")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Button {
                        print("Change Location")
                        
                    } label: {
                        HStack{
                            Text("Change")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                }

            }
            Section("Add Address"){
                
            }
            
            Section("Add Address Label"){
                
            }
            
            Section("Receiver Details"){
                
            }
            
        }
        
        Button {
            print("Click Save Address")
            
        } label: {
            HStack{
                Text("Save Address")
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .background(Color(.systemBlue))
        .cornerRadius(10)
        .padding(.top,24)
        
    }
}

#Preview {
    AddAddressDetails()
}
