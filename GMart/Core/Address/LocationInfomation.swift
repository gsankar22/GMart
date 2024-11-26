//
//  LocationInfomation.swift
//  GMart
//
//  Created by Gowrisankar Samy on 25/11/24.
//

import SwiftUI
import MapKit


struct LocationInfomation: View {
    @State private var searchText = ""
    @State private var searchIsActive = false

    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )

    var body: some View {
        Text("Location Information")
        VStack(spacing: 10){
          /*  NavigationStack {
                    Text("Searching for \(searchText)")
                        .navigationTitle("Search Your Location")
                }
            .searchable(text: $searchText,
                        isPresented: $searchIsActive,
                        prompt: "Search") */
            NavigationStack {
            }
            .searchable(text: $searchText,
                        isPresented: $searchIsActive,
                        prompt: "Search Your Location")
           
            Map()
                .mapStyle(.hybrid(elevation: .realistic))
                .frame(width: UIScreen.main.bounds.width, height: 350)
            
            VStack (alignment: .leading, spacing: 20){
                Text("Narayana Nagar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("BABA VILLA, Flat No: C First Floor, Plot No : 13, Second North Cross Street, Sri Kapaleeswarar Nagar, Neelangarai. Chennai - 600115")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.bottom , 15)
            
            Button {
                print("Location confirm")
                
            } label: {
                HStack{
                    Text("Confirm")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            
            Spacer()
            
            
        }
        
    }
}

#Preview {
    LocationInfomation()
}
