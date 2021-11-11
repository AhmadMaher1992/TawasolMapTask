////
////  ApiService.swift
////  TawasolMapTask
////
////  Created by Ahmad Eisa on 09/11/2021.
////
//
//import Foundation
//class APIService {
//    
//    //{"token":"54b98bb480e504f94c651f20c8fb117d23DC2DDD64EAF2F709DD84CFAD16281F5C622054"}
//    static let shared = APIService()
//    private init(){}
//    
//    func getUserInformation(token: String , completion: @escaping UserInfoCompletion){
//       
//        
//       // let token = URLQueryItem(name: "params", value: tokenDic)
//      //  let postString = "?svc=token/login&params=\(tokenDic)"
//        
//        let urlString = URLs.tokenURL
//       
//        let tokenDict = ["token": token]
//        let tokenString = tokenDict.queryString
//        
//        
//        let  parameters: [String: Any] = [  "svc": "token/login","params":tokenString ]
//        var urlComponents = URLComponents(string: urlString)
//        
//        var queryItems = [URLQueryItem]()
//      
//        for (key, value) in parameters {
//
//            
//            queryItems.append(URLQueryItem(name: key, value: value as! String   ))
//        }
//        
//        urlComponents?.queryItems = queryItems
//        
//        APIService.getGenerics(urlComponents: urlComponents!, completion: completion)
//    }
//    
//    
//    
//    
//    
//    
//}
//
//
//
//
//
//
//
//
//
////------------------------------------------
//// MARK:-GET Generic
////------------------------------------------
//
//extension APIService {
//    
//    
//    
//    
//    
//    static func getGenerics<T:Codable>(urlComponents: URLComponents ,completion:@escaping (T?,Error?)->Void)  {
//        
//    
//        var request = URLRequest(url: (urlComponents.url)!)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = [
//            "X-API-Key": "123456"
//        ]
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        URLSession.shared.dataTask(with: request) { (data, resp, error) in
//            if let error = error {
//                
//                DispatchQueue.main.async {
//                    completion(nil, error)
//                }
//                
//                print("\n\n------------------------------------------------------")
//                print("😥😥😥😥😥😥😥😥😥😥😥😥")
//                
//                print("DEBUG: Web Request Failed:😝---> \(String(describing: error))")
//                print("------------------------------------------------------\n")
//                return
//            }
//            
//            guard let data = data else {
//                print("DEBUG:  Did not receive data ")
//                return
//            }
//            guard let response = resp as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
//                print("DEBUG: HTTP request failed")
//                return
//            }
//            
//            do {
//                let objects = try JSONDecoder().decode(T.self, from: data)
//                print("\n\n------------------------------------------------------")
//                print("✅ ✅ ✅ ✅ ✅ ✅ ✅ ✅ ✅ ✅ ✅ ✅")
//                // succes
//                
//                print("DEBUG:Decoding Successful & Here your Model ⬇⏬\n \(objects)")
//                print("------------------------------------------------------\n")
//                
//                DispatchQueue.main.async {
//                    completion(objects, nil)
//                }
//                
//            } catch let error {
//                print("\n\n------------------------------------------------------")
//                print("😥😥😥😥😥😥😥😥😥😥😥😥")
//                
//                print("DEBUG: Error in Mapping: 😝---> \n\(error.localizedDescription)  ")
//                print("------------------------------------------------------\n")
//                DispatchQueue.main.async {
//                    completion(nil, error)
//                }
//                
//            }
//            
//            
//            
//            do {
//                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
//                    print("Error: Cannot convert data to JSON object")
//                    return
//                }
//                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
//                    print("Error: Cannot convert JSON object to Pretty JSON data")
//                    return
//                }
//                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
//                    print("Error: Could print JSON in String")
//                    return
//                }
//                
//                //      print("DEBUG: Pretty JSON: \n \(prettyPrintedJson)  ")
//                
//            } catch {
//                print("Error: Trying to convert JSON data to string")
//                return
//            }
//            
//            
//        }.resume()
//    }
//    
//}
//
//
//
////------------------------------------------
//// MARK:- POST Generic
////------------------------------------------
//
//
//extension APIService {
//    
//    
//    
//    static func postGeneric<T:Codable>(postString: String,url: URL, completion:@escaping (T?,Error?)->Void)  {
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        print("DEBUG: URL: \(url) ")
//        
//        request.httpBody = postString.data(using: .utf8)
//        
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            
//            
//            if let error = error {
//                
//                DispatchQueue.main.async {
//                    completion(nil,error)
//                }
//                print("\n\n------------------------------------------------------")
//                print("😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥")
//                print("DEBUG: Web Request Failed:😝---> \(String(describing: error))")
//                print("------------------------------------------------------\n")
//                return
//            }
//            
//            /* get your json data */
//            guard let data = data else { return }
//            
//            do {
//                
//                _ = try JSONSerialization.jsonObject(with: data, options: [])
//                // print("✅DEBUG GENERIC: Web Request JSON😀:\n",json)
//            } catch {
//                print("\n\n------------------------------------------------------")
//                print("😥😥😥😥😥😥😥😥😥😥😥😥")
//                print("DEBUG:Invalid JSON:😝--->\n\(error.localizedDescription)  ")
//                print("------------------------------------------------------\n")
//            }
//            
//            
//            let jsonDecoder = JSONDecoder()
//            do {
//                //We can decode json in just one line
//                let model = try jsonDecoder.decode(T.self, from: data)
//                // success
//                // we have good data – go back to the main thread
//                DispatchQueue.main.async {
//                    completion(model,nil)
//                }
//                
//                
//                
//                print("\n\n------------------------------------------------------")
//                print("✅ ✅ ✅ ✅ ✅ ✅ ✅ ✅ ✅ ✅ ✅ ✅")
//                print("DEBUG:Decoding Successful & Here your Model ⬇⏬\n\(model)  ")
//                print("------------------------------------------------------\n")
//                
//                
//            } catch let error {
//                print("\n\n------------------------------------------------------")
//                print("😥😥😥😥😥😥😥😥😥😥😥😥")
//                print("DEBUG: Error in Mapping: 😝---> \n\(error.localizedDescription)  ")
//                print("------------------------------------------------------\n")
//                DispatchQueue.main.async {
//                    completion(nil,error)
//                }
//                
//            }
//            
//            
//        }.resume()
//    }
//    
//}
