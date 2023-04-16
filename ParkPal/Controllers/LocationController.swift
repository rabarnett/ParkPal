//
//  LocationController.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import Foundation
import CoreLocation


class LocationController : NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    @Published var authorizationStatus =  CLAuthorizationStatus.denied
    
    override init() {
        super.init()
        locationManager.delegate = self
   }
    
    func locationDataAutho() //Authorization for access to user location
    {
        
        switch locationManager.authorizationStatus //Act based on authorization status
        {
            case .authorizedWhenInUse: //Allowed while in use
                authorizationStatus = .authorizedWhenInUse
                print("Autorized when in use")
                
            case .restricted: //When we are not allowed to use
                //Add code to ask for access
                authorizationStatus = .restricted
                print("Location access was denied.")
                
            case .denied: //When we are not allowed to use
                //Add code to ask for access
                authorizationStatus = .denied
                print("Location access was denied.")
                
            case .notDetermined: //User has not decided yet
                authorizationStatus = .notDetermined//Request access to location
                print("Not determined")
            default:
                break//By deafault do nothing
        }
    }
}
