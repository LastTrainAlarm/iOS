//
//  NearData.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 24..
//  Copyright © 2018년 양어진. All rights reserved.
//

import Foundation

struct NearData: Codable {
    let status : Bool
    let message: String
    let result : [Near]
}
