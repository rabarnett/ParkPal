//
//  User.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import Foundation


class User: Codable {
    
    var fname: String
    var lname: String
    var username: String
    var password: String
    var latwhole: Int
    var latdecimal: Int
    var lonwhole: Int
    var londecimal: Int
    
    init(fname: String, lname: String, username: String, password: String, latwhole: Int, latdecimal: Int, lonwhole: Int, londecimal: Int) {
        self.fname = fname
        self.lname = lname
        self.username = username
        self.password = password
        self.latwhole = latwhole
        self.latdecimal = latdecimal
        self.lonwhole = lonwhole
        self.londecimal = londecimal
    }
    
}
