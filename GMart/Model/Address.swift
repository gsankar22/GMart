//
//  Address.swift
//  GMart
//
//  Created by Gowrisankar Samy on 25/11/24.
//

import Foundation

struct Address: Identifiable, Codable {
   
    let id: String
    let addressType: String
    let fullAddress: String
}

extension Address{
    static var Mock_Address = Address(id: NSUUID().uuidString, addressType: "Home", fullAddress: "BABA VILLA, Flat No: C First Floor, Plot No : 13, Second North Cross Street, Sri Kapaleeswarar Nagar, Neelangarai. Chennai - 600115")
}
