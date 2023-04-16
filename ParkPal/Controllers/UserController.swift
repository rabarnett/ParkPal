//
//  UserController.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import Foundation


class UserController: ObservableObject {
    
    @Published private(set) var user: User?
    @Published private(set) var locations: [Location] = []
    
    init() {
        
        guard let data = UserDefaults.standard.data(forKey: "user") else {
            return
        }
        
        guard let decoded = try? JSONDecoder().decode(User.self, from: data) else {
            return
        }
        
        user = decoded
        
    }
    
    func updateUser(to user: User) {
        self.user = user
    }
    
    func updateLocations(to locations: [Location]) {
        self.locations = locations
    }
}
