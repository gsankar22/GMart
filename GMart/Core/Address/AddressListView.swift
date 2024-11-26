//
//  AddressListView.swift
//  GMart
//
//  Created by Gowrisankar Samy on 25/11/24.
//

import SwiftUI

struct AddressListView: View {
    var body: some View {
        Text("Addresses")
        List{
            Section{
                AddressCustomeView(addressType: Address.Mock_Address.addressType, fullAddress: Address.Mock_Address.fullAddress, editTineColor: Color(.systemBlue), deleteTineColor: Color(.systemRed))
                AddressCustomeView(addressType: Address.Mock_Address.addressType, fullAddress: Address.Mock_Address.fullAddress, editTineColor: Color(.systemBlue), deleteTineColor: Color(.systemRed))
            }
        }
        
        Button {
            print("Add new Address")
        } label: {
            HStack{
                Text("Add New Address")
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .background(Color(.systemBlue))
        .cornerRadius(10)
        .padding(.top,5)
    }
}

#Preview {
    AddressListView()
}
