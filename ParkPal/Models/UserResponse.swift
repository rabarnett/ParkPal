//
//  UserResponse.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import Foundation


struct UserResponse: Codable {
    
    var query_string: String
    var metadata: UserMetadata
    var data: [User]
    
}

struct UserMetadata: Codable {
    
    var fname: String
    var lname: String
    var username: String
    var password: String
    var email: String
    var latwhole: String
    var latdecimal: String
    var lonwhole: String
    var londecimal: String
    
}
