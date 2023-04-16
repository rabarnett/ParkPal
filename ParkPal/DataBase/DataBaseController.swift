//
//  DataBaseController.swift
//  ParkPal
//
//  Created by Reese Barnett on 4/15/23.
//

import Foundation

final class DataBaseController {
    
    let authentication = "v2_434YS_2BcJ5SUruph7Zp7QZ423VAt"
    let username = "parkpal"
    let dbName = "parkpal"
    let headers = [
        "accept": "application/json",
        "content-type": "application/json",
        "authorization": "Bearer v2_434YS_2BcJ5SUruph7Zp7QZ423VAt"
    ]
    
    
    func fetchUser(name: String, password: String, userController: UserController) async throws {
        
        
        let parameters = [
          "query_string": "select * from users where (username = '\(name)' or email = '\(name)') and password = '\(password)'",
          "database_name": "\(username)/\(dbName)"
        ]
        
        let url = "https://api.bit.io/v2beta/query?data_format=objects"
        
        let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        let request = getRequest(url: url, httpMethod: "POST", header: headers, bodyData: postData)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("Connection Error")
            throw CustomError.invalidUser
        }
        
        guard let result = try? JSONDecoder().decode(UserResponse.self, from: data) else {
            print("Decoding failed")
            throw CustomError.invalidUser
        }
        
        guard let user = result.data.first else {
            print("No user exist with those credintials")
            throw CustomError.invalidUser
        }
        
        userController.updateUser(to: user)
    }
    
    func fetchLocations(userController: UserController) async throws {
        
        let parameters = [
          "query_string": "SELECT * FROM locations",
          "database_name": "\(username)/\(dbName)"
        ]
        
        let url = "https://api.bit.io/v2beta/query?data_format=objects"
        
        let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        let request = getRequest(url: url, httpMethod: "POST", header: headers, bodyData: postData)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("Connection Error")
            throw CustomError.invalidUser
        }
        
        guard let result = try? JSONDecoder().decode(LocationResponse.self, from: data) else {
            print("Decoding failed")
            throw CustomError.invalidUser
        }
        
        userController.updateLocations(to: result.data)
    }
    
    func createUser(fname: String, lname: String, username: String, password: String, email: String, userController: UserController) async throws {
        
        try await sendQuery(query: "INSERT INTO users VALUES ('\(fname)', '\(lname)', '\(username)', '\(password)', '\(email)', 0, 0, 0, 0)")
        
        userController.updateUser(to: User(fname: fname, lname: lname, username: username, password: password, latwhole: 0, latdecimal: 0, lonwhole: 0, londecimal: 0))
    }
    
    func sendQuery(query: String) async throws {
        
        let headers = [
          "accept": "application/json",
          "content-type": "application/json",
          "authorization": "Bearer \(authentication)"
        ]
        
        let parameters = [
          "query_string": query,
          "database_name": "\(username)/\(dbName)"
        ]
        
        let url = "https://api.bit.io/v2beta/query?data_format=objects"
        
        let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        let request = getRequest(url: url, httpMethod: "POST", header: headers, bodyData: postData)
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("Connection Error")
            return
        }
    }
    
    private func getRequest(url: String, httpMethod: String, header: [String:String], bodyData: Data? = nil) -> URLRequest {
        
        var request = URLRequest(url: URL(string: url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = httpMethod
        request.allHTTPHeaderFields = header
        
        if let data = bodyData {
            request.httpBody = data
        }
        
        return request
    }
}
