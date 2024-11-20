//
//  SettingsRowView.swift
//  GMart
//
//  Created by Gowrisankar Samy on 19/11/24.
//

import SwiftUI

struct SettingsRowView: View {
    
    let imageName:String
    let title: String
    let tineColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tineColor)
            Text(title)
                .font(.subheadline) 
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SettingsRowView(imageName: "gear", title: "version", tineColor: Color(.systemGray))
}
