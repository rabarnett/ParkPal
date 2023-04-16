//
//  LocationResponse.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import Foundation

struct LocationResponse: Codable {
    
    var query_string: String
    var metadata: LocationMetadata
    var data: [Location]
    
}

struct LocationMetadata: Codable {
    
    var locname: String
    var loclatiwhole: String
    var loclatidecimal: String
    var loclongiwhole: String
    var loclongidecimal: String
    var open: String
    var close: String
    var rating: String
    var description: String
    
}
