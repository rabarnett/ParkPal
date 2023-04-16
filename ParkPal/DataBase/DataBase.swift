//
//  DataBase.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import Foundation

struct DataBases: Codable {
    var databases: [DataBase]
}

struct DataBase: Codable {
    
    struct Usage: Codable {
        
        var rows_queried: Int
        var period_start: String
        var period_end: String
    }
    
    var id: String
    var name: String
    var date_created: String
    var is_private: Bool
    var role: String
    var storage_limit_bytes: Int
    var storage_usage_bytes: Int
    var usage_current: Usage
    var usage_previous: Usage
}
