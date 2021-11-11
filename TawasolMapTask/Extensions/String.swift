//
//  String.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 09/11/2021.
//

import Foundation


extension String {
    
    func toSecrueHttps() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}


extension Dictionary {
    
    
    
    var queryString: String {
        var output: String = ""
        forEach({ output += "\($0.key)=\($0.value)&" })
        output = String(output.dropLast())
        return output
    }
}
