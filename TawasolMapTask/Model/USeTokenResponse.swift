//
//  USeTokenResponse.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 08/11/2021.
//


import Foundation


//------------------------------------------
// MARK: - USerInfoResponse
//------------------------------------------

struct USerInfoResponse: Codable {
    
    let host, eid, gisSid, au: String?
    let tm: Int?
    let wsdkVersion, api, localVersion: String?
    let env: Env?
    let baseURL, hwGwIP: String?
    let user: User?
    let token, th: String?
    let classes: [String: Int]?
    let features: Features?

    enum CodingKeys: String, CodingKey {
        case host, eid
        case gisSid = "gis_sid"
        case au, tm
        case wsdkVersion = "wsdk_version"
        case api
        case localVersion = "local_version"
        case env
        case baseURL = "base_url"
        case hwGwIP = "hw_gw_ip"
        case user, token, th, classes, features
    }
}


//------------------------------------------
// MARK: - Env
//------------------------------------------
struct Env: Codable {
    let maxHTTPBuff: Int?

    enum CodingKeys: String, CodingKey {
        case maxHTTPBuff = "max_http_buff"
    }
}

//------------------------------------------
// MARK: - Features
//------------------------------------------

struct Features: Codable {
    let unlim: Int?
    let svcs: [String: Int]?
}
//------------------------------------------
// MARK: - User
//------------------------------------------
struct User: Codable {
    let nm: String?
    let cls, id: Int?
    let prp: [String: String]?
    let crt, bact, mu, ct: Int?
    let ftp: FTP?
    let fl: Int?
    let hm: String?
    let ld, pfl: Int?
    let ap: String?
    let mapps: Mapps?
    let mappsmax, uacl: Int?
}


//------------------------------------------
// MARK: - FTP
//------------------------------------------
struct FTP: Codable {
    let ch, tp, fl: Int?
}


//------------------------------------------
// MARK: - Mapps
//------------------------------------------
struct Mapps: Codable {
    let the1: The1?

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
    }
}

//------------------------------------------
// MARK: - The1
//------------------------------------------

struct The1: Codable {
    let id: Int?
    let n, uid: String?
    let cp: Cp?
    let the1_As: As?
    let e: Int?

    enum CodingKeys: String, CodingKey {
        case id, n, uid, cp
        case the1_As = "as"
        case e
    }
}

//------------------------------------------
// MARK: - Cp
//------------------------------------------

struct Cp: Codable {
    let uh, ui: Int?
    let un: String?
}

//------------------------------------------
// MARK: - As
//------------------------------------------

struct As: Codable {
    let appid, device, type: String?
}
