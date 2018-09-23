//
//  HttpResponseCode.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 24..
//  Copyright © 2018년 양어진. All rights reserved.
//

import Foundation

enum HttpResponseCode: Int{
    case GET_SUCCESS = 200
    case POST_SUCCESS = 201
    case WRONG_REQUEST = 400
    case SERVER_ERROR = 500
}

