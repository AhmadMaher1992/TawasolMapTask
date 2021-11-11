//
//  Service.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 10/11/2021.
//

import Foundation
import Alamofire

class API {
    
    static let shared = API()
    private init(){}
    
    //1 Get USer Information
    func getUserInformation(token: String , completion: @escaping UserInfoCompletion){
        let tokenDict  = ["token": token]
        
        let tokenString = Helper.stringify(json: tokenDict, prettyPrinted: false)
        let  parameters: [ String : Any] = [ "svc": "token/login" , "params": tokenString ]
        let urlString = URLs.tokenURL
        
        API.requestGenerics(url: urlString, parameters: parameters, method: .get , completion: completion)
        
    }
    
    
    
    
    //2 Get Units
    func getUnits(eid: String , completion: @escaping GetUnitsCompletion){
        
        
        let paramsDictionary: [String: Any] = [
            "spec": ["itemsType":"avl_unit","propName":"sys_name","propValueMask":"*","sortType":"sys_name"] ,
            "force":1 ,
            "flags":13644935,
            "from":0,
            "to":10000
            
        ]
        
        let paramsString = Helper.stringify(json: paramsDictionary, prettyPrinted: false)
        let parameters :Parameters = [
            "params": paramsString ,
            "svc": "core/search_items",
            "sid":eid
            
        ]
        let urlString = URLs.getUnitsURL
        API.requestGenerics(url: urlString, parameters: parameters, method: .get, completion: completion)
        
        
        
    }
    
    
    
    
    
    //3 getAddress
    
    func getAddress(userID: Int , completion: @escaping([String]? , Error?,String?) -> Void){
        
        let urlString = URLs.getAddressURL
        let dict: [String: Any] =  ["lon":46.632892,"lat":24.771972]
        let strng = Helper.stringify(json: [dict], prettyPrinted: false)
        let parameters :Parameters = [
            "coords": strng ,
            "uid": userID
            
        ]
        
        AF.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil, error, nil)
                return
            }
            
         
            
            if let strArr = response.value  as? [String] {
                print("DEBUG: ADDRESSARRAy: \(strArr) ")
                completion(strArr , nil , nil)
            }
            
        }
        
    }
    
    
    //4 getSensorsValues
    
    func getSensorsValues(eid: String , completion: @escaping ([String: Double]? , Error?,String?) -> Void){
        
        
        let urlString = URLs.tokenURL
      
        let dict: [String: Double] = ["unitId":2751]
        let strng = Helper.stringify(json: dict, prettyPrinted: false)
        
        
        let parameters :Parameters = [
            "svc": "unit/calc_last_message" ,
            "params":strng ,
            "sid": eid
            
        ]
        
        AF.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil, error, nil)
                return
            }
            
         
            
            if let dictArr = response.value  as? [String: Double] {
                print("DEBUG: ADDRESSARRAy: \(dictArr) ")
                completion(dictArr , nil , nil)
            }
            
        }

        
    }
    
    
    
    
    //------------------------------------------
    // MARK: - Generic Request
    //------------------------------------------
    static func requestGenerics<T:Codable>(url: String, parameters:Parameters, method: HTTPMethod ,completion:@escaping (T?,Error?,String?)->Void)  {
        
        AF.request(url, method: method, parameters: parameters, encoding: URLEncoding.default,
                   headers: [:]).validate(statusCode: 200 ..< 299).responseJSON { response in
            
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil, error, nil)
                return
            }
            guard let data = response.data else {
                print("DEBUG: Error: Cann't Get Data From Server ")
                return
                
            }
            
            
            
            let jsonDecoder = JSONDecoder()
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("DEBUG: Error: Cannot convert data to JSON object")
                    return
                }
                
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("DEBUG: Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("DEBUG: Error: Could print JSON in String")
                    return
                }
                // print("DEBUG: Pretty JSON:\n \(prettyPrintedJson)  ")
                
                
                let model = try jsonDecoder.decode(T.self, from: data)
                
                completion(model,nil, prettyPrintedJson)
                
                
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil, error, nil)
                return
            }
            
        }
        
        
    }
    
    
}
