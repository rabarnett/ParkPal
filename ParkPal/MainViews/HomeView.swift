//
//  HomeView.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var userModel: UserController
    @EnvironmentObject var locationModel: LocationController
    
    var body: some View {
        VStack {
            Text("Welcome, \(userModel.user?.fname ?? "Failed to get name")")
                .foregroundColor(.white)
                .font(.largeTitle)
            CardStack()
        }
        .onAppear {
            locationModel.locationManager.requestWhenInUseAuthorization()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserController())
            .environmentObject(LocationController())
    }
}
