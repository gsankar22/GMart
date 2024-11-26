//
//  AddressCustomeView.swift
//  GMart
//
//  Created by Gowrisankar Samy on 25/11/24.
//

import SwiftUI

struct AddressCustomeView: View {
    
    var addressType:String
    var fullAddress: String
    var editTineColor: Color
    var deleteTineColor: Color

    
   // var address: Address
    var body: some View {
        HStack{
            Image(systemName: "figure.walk.circle")
                .font(.title)
                .imageScale(.large)
                .padding(.top,10)
                
            VStack (alignment: .leading , spacing: 4) {
                Text( Address.Mock_Address.addressType)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.top, 4)
                Text(Address.Mock_Address.fullAddress)
                    .font(.footnote)
                    .accentColor(.gray)
            }
            HStack(spacing: 10){

                Button {
                    print("Edit Address")
                } label: {
                    Image(systemName: "pencil.and.list.clipboard")
                        .imageScale(.small)
                        .font(.title)
                    .foregroundColor(editTineColor)
                }
                
                Button {
                    print("Delete Address")
                } label: {
                    Image(systemName: "xmark.bin.circle")
                        .imageScale(.small)
                        .font(.title)
                        .foregroundColor(deleteTineColor)
                }
             
            }
        }
    
    }
}

#Preview {
    AddressCustomeView(addressType: Address.Mock_Address.addressType, fullAddress: Address.Mock_Address.fullAddress, editTineColor: Color(.systemBlue),deleteTineColor: Color(.systemRed))
}
