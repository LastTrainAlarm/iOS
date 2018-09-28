//
//  GettableService.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 24..
//  Copyright © 2018년 양어진. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol GettableService {
    associatedtype NetworkData : Codable
    typealias networkResult = (resCode : Int, resResult : NetworkData)
    func get(_ URL:String, completion : @escaping (Result<networkResult>)->Void)
}

extension GettableService {
    
    func gino(_ value : Int?) -> Int {
        return value ?? 0
    }
    
    
    func get(_ URL:String, completion : @escaping (Result<networkResult>)->Void){
        guard let encodedUrl = URL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("networking - invalid url")
            return
        }
        
        let userToken = UserDefaults.standard.string(forKey: "userToken") ?? "-1"
        var headers: HTTPHeaders?
        
        if userToken != "-1" {
            headers = [
                "authorization" : userToken
            ]
        }
        
        Alamofire.request(encodedUrl, method: .get, parameters: nil, headers: headers).responseData {(res) in
            print("encodedURL = ", encodedUrl)
        
            switch res.result {
                
            case .success :
                if let value = res.result.value {
                    print("networking Success!")
                    print(encodedUrl)
                    print(JSON(value))
                    print(value)
                    
                    let decoder = JSONDecoder()
                    print("1")
                    
                    do {
                        print("2")
                        
                        let resCode = self.gino(res.response?.statusCode)
                        print("3")
                        
                        
                        let datas = try decoder.decode(NetworkData.self, from: value)
                        print("4")
                        let result : networkResult = (resCode, datas)
                        print("5")
                        completion(.success(result))
                        print("success")
                        
                    } catch{
                        completion(.error("error - GettableService"))
                    }
                }
                break
            case .failure(let err) :
                print("network~~ error")
                print(err)
                completion(.failure(err))
                break
            }
            
        }
    }
}
