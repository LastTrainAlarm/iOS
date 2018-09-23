//
//  enums.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 24..
//  Copyright © 2018년 양어진. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(String)
    case failure(Error)
}

enum NetworkResult<T> {
    case networkSuccess(T)
    case nullValue
    case duplicated
    case serverErr
    case networkFail
    case wrongInput
}
