//
//  APIService.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 22..
//  Copyright © 2018년 양어진. All rights reserved.
//

import Foundation

protocol APIService {}

extension APIService {
    func url(_ path: String) -> String {
        return "http://18.235.225.253:3264" + path
    }
    
    func gsno(_ value : String?) -> String{
        return value ?? ""
    }
    
    func gino(_ value : Int?) -> Int {
        return value ?? 0
    }
    
}
