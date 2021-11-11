//
//  Helper.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 10/11/2021.
//

import UIKit


class Helper{
    
    
   static func stringify(json: Any, prettyPrinted: Bool = false) -> String {
        var options: JSONSerialization.WritingOptions = []
        if prettyPrinted {
            options = JSONSerialization.WritingOptions.prettyPrinted
        }

        do {
          let data = try JSONSerialization.data(withJSONObject: json, options: options)
          if let string = String(data: data, encoding: String.Encoding.utf8) {
              return string
          }
        } catch {
              print(error)
        }
        return ""
    }
    
    
    static func freezeUI(){
        UIApplication.shared.beginIgnoringInteractionEvents()
        
    }
    
    static func activeUI(){
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
        //save and get api Token
    class func api_toket()->String {
        
        let api_token = "token"
        return api_token
    }
    
    class func SaveApitoken(token : String?){
        
        let def = UserDefaults.standard
        def.setValue(token, forKey: api_toket())
        def.synchronize()
        
    }
    
    
    // Save and get user name
    class func Saveuser_namen(name : String?){
        
        let def = UserDefaults.standard
        def.setValue(name, forKey: user_name())
        def.synchronize()
        
        
    }
    
    
    class func getaUser_name()->String? {
        
        let def = UserDefaults.standard
        return def.object(forKey: user_name()) as? String
        
        
        
    }
    
    class func user_name()->String {
        
        let user_name = "name"
        return user_name
    }
    
    
    //save Eid
    class func saveEid(eid : String?){
        let def = UserDefaults.standard
        def.setValue(eid, forKey: eidKey())
        def.synchronize()
        
    }
    
    class func getEid()->String?{
        let def = UserDefaults.standard
        return def.object(forKey: eidKey()) as? String
    }
    
    class func eidKey()->String{
        let eid = "eidKey"
        return eid
    }
    
    //save User ID
    class func Saveuser_id(user_id : Int?){
        
        let def = UserDefaults.standard
        def.setValue(user_id, forKey: self.user_id())
        def.synchronize()
        
        
    }
    class func getaUser_id()->Int? {
        
        let def = UserDefaults.standard
        return def.object(forKey: user_id()) as? Int
        
        
        
    }
    class func user_id()->String {
        
        let user_id = "user_id"
        return user_id
    }
    
    
}
