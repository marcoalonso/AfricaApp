//
//  MapView.swift
//  AfricaApp
//
//  Created by marco rodriguez on 26/07/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - Properties
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: -2.333, longitude: 34.89450)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - Body
    var body: some View {
        // MARK: - 1.- Basic Map
        //Map(coordinateRegion: $region)
        
        // MARK: - 2.- Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
         item in
            // A Pin old style
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) MARKER: NEW STYLE AL
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) Custom Basic Annotation
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }//: Annotation
            // (D) Custom advanced annotation (interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        })//: Map
        
        .overlay(
            HStack(alignment: .center, spacing: 13) {
                Image("compass")
                .resizable()
                .scaledToFit()
                    .frame(width: 45, height: 45, alignment: .center)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }//: HStack
            .padding(.vertical, 15)
            .padding(.horizontal, 15)
            .background(
                Color.black
                    .cornerRadius(10)
                    .opacity(0.6)
            )
            .padding(), alignment: .top
        )
    }
}

// MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
