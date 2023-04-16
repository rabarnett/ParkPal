//
//  MapView.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion
    
    init (latitude: Float, longitude: Float) {
        
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: CLLocationDegrees(floatLiteral: Double(latitude)),
                longitude: CLLocationDegrees(floatLiteral: Double(longitude))),
            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        )
        
    }
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: 37.95096599, longitude: -91.77839790)
    }
}
