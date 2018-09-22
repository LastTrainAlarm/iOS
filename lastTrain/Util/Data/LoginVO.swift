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
    let userIdx : Int?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case userIdx = "user_idx"
    }
    
}
