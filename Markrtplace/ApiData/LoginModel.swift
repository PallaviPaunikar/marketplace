//
//  LoginModel.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 18/02/24.
//

import Foundation

struct LoginModel: Codable {
    let id: String
    let name: String
    let email: String
    let mobile: String
    let token: String
    let success: String
    

    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case email = "email"
        case mobile = "mobile"
        case token = "token"
        case success = "success"
        
    }
}

