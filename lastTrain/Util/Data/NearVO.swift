//
//  NearVO.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 24..
//  Copyright © 2018년 양어진. All rights reserved.
//
/*
import Foundation


struct Near: Codable {
    let status : Bool
    let message: String
    let station_name : String
    let station_x : Float
    let station_y : Float
    let fav_onoff : Bool
}
*/
//"station_name": "서울",
//"station_x": "37.5559802396321",
//"station_y": "126.972091251236",
//"fav_onoff" : 1


import Foundation

struct Near: Codable {
    let station_name : String
    let station_x : Float
    let station_y : Float
    let fav_onoff : Int
    
//    enum CodingKeys: String, CodingKey {
//        case stationName = "station_name"
//        case stationX = "station_x"
//        case stationY = "station_y"
//        case favOnoff = "fav_onoff"
//    }
}
