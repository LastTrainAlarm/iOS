//
//  NearService.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 24..
//  Copyright © 2018년 양어진. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


struct NearService: GettableService {
    
    typealias NetworkData = NearData
    static let shareInstance = NearService()
    
    func nearInit(url : String, completion : @escaping (NetworkResult<Any>) -> Void){
        
        get(url) { (result) in
            switch result {
            case .success(let networkResult):
                switch networkResult.resCode {
                //여기
                case 200 :
                    completion(.networkSuccess(networkResult.resResult.result))
                case 300 :
                    completion(.nullValue)
                case 500 :
                    completion(.serverErr)
                case 403:
                    completion(.wrongInput)
                default :
                    print("no 200/300/500/403 resCode is \(networkResult.resCode)")
                    break
                    //여기
                }
                break
            case .error(let errMsg) :
                print(errMsg, "Near Service")
                break
            case .failure(_) :
                completion(.networkFail)
            }
        }
    }
    
//    func nearInit(url : String, completion : @escaping (NetworkResult<Any>) -> Void){
//
//        get(url) { (result) in
//            switch result {
//            case .success(let networkResult):
//                switch networkResult.resCode {
//                //여기
//                case 200 :
//                    completion(.networkSuccess(networkResult.resResult.result))
//                case 300 :
//                    completion(.nullValue)
//                case 500 :
//                    completion(.serverErr)
//                case 403:
//                    completion(.wrongInput)
//                default :
//                    print("no 200/300/500/403 resCode is \(networkResult.resCode)")
//                    break
//                    //여기
//                }
//                break
//            case .error(let errMsg) :
//                print(errMsg, "Near Service")
//                break
//            case .failure(_) :
//                completion(.networkFail)
//            }
//        }
//    }
    
}
