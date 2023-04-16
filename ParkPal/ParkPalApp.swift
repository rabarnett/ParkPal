//
//  ParkPalApp.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import SwiftUI

@main
struct ParkPalApp: App {
    
    @StateObject private var userModel = UserController()
    @StateObject private var viewRouter = ViewRouter()
    @StateObject private var locationManager = LocationController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
                .environmentObject(userModel)
                .environmentObject(viewRouter)
        }
    }
}
