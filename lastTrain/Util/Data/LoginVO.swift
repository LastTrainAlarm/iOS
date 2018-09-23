//
//  LoginVO.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 22..
//  Copyright © 2018년 양어진. All rights reserved.
//

import Foundation
struct LoginVO: Codable {
    let status : Bool
    let message: String
    let user_id : Int?
    let user_pw : Int?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case user_id = "user_id"
        case user_pw = "user_pw"
    }
    
}
