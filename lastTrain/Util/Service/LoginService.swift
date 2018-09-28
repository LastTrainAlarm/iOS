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
    func loginInit(url : String, params : [String : Any], completion : @escaping (NetworkResult<Any>) -> Void){
        post(url, params: params) { (result) in
            switch result {
            case .success(let networkResult):
                switch networkResult.message {
                case "Successfully sign in" :
                    completion(.networkSuccess(networkResult.data))
                case "Null Value" :
                    completion(.nullValue)
                case "Login Failed - incorrect pw" , "Login Failed - incorrect id" :
                    completion(.wrongInput)
                case "Internal Server Error!" :
                    completion(.serverErr)
                default :
                    print("loginError")
                    break
                }
                
                break
            case .error(let errMsg) :
                print(errMsg,"-LoginService")
                break
            case .failure(_) :
                completion(.networkFail)
            }
        }
        
    }
    
}
