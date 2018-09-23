//
//  LoginService.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 24..
//  Copyright © 2018년 양어진. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


struct LoginService: PostableService {
    typealias NetworkData = LoginVO
    static let shareInstance = LoginService()
    func login(url : String, params : [String : Any], completion : @escaping (NetworkResult<Any>) -> Void){
        post(url, params: params) { (result) in
            switch result {
            case .success(let networkResult):
                switch networkResult.message {
                case "Login Success" :
                    completion(.networkSuccess(self.gino(networkResult.user_id)))
                case "Null Value" :
                    completion(.nullValue)
                case "Login Failed" :
                    completion(.wrongInput)
                case "Internal Server Error!" :
                    completion(.serverErr)
                default :
                    break
                }
                
                break
            case .error(let errMsg) :
                print(errMsg)
                break
            case .failure(_) :
                completion(.networkFail)
            }
        }
        
    }
    
}
