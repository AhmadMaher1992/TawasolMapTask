//
//  Config.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 09/11/2021.
//

import Foundation



//------------------------------------------
// MARK: -URLs
//------------------------------------------

struct URLs {
    static let main = "http://gps.tawasolmap.com/"
    
    /// POST {userName: String, password: String} Login
    static let loginURL = main + "login.html"
    /// POST {svc: String , params: [String: String]} Use access token to get user information
    static let tokenURL = main+"wialon/ajax.html"
    /// POST {svc: String , params: [String: String] ,sid: String } Use eid  to get Units
    static let getUnitsURL = main+"wialon/ajax.html"
    /// POST {coords: [String: String], uid: Int} Get Address
    static let getAddressURL = main+"gis_geocode"

    
}



//------------------------------------------
// MARK: - Completion
//------------------------------------------
typealias  UserInfoCompletion = (USerInfoResponse?,Error?,String?)->Void
typealias GetUnitsCompletion = (GetUnitsResponse? , Error?,String?) -> Void
