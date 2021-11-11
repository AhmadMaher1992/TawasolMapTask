//
//  GetUnitsResponse.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 10/11/2021.
//

import Foundation


//------------------------------------------
// MARK: -GetUnitsResponse
//------------------------------------------
struct GetUnitsResponse: Codable {
    let searchSpec: SearchSpec?
    let dataFlags, totalItemsCount, indexFrom, indexTo: Int?
    let items: [Item]?
}


//------------------------------------------
// MARK: - Item
//------------------------------------------
struct Item: Codable {
    let nm: String? //name
    let cls, id: Int?
    let prp: Prp?
    let crt, bact, mu, ct: Int?
    let ftp: FTP?
    let pos: ItemPos? //position
    let lmsg: Lmsg?
    let sens: [String: Sen]?
    let cfl, cnm: Int?
    let cneh: Double?
    let cnkb: Int?
    let prms: Prms?
    let pflds: Pflds?
    let uacl: Int?
}


//------------------------------------------
// MARK: - Lmsg
//------------------------------------------

struct Lmsg: Codable {
    let t, f: Int?
    let tp: Tp?
    let pos: VClass?
    let i, o, lc: Int?
    let p: [String: Double]?
}

//------------------------------------------
// MARK: -VClass
//------------------------------------------

struct VClass: Codable {
    let y, x: Double?
    let z, s, c, sc: Int?
}

enum Tp: String, Codable {
    case ud = "ud"
}

// MARK: - Pflds
struct Pflds: Codable {
}

// MARK: - ItemPos
struct ItemPos: Codable {
    let t, f, lc: Int?
    let y, x: Double?// longitude = “x”     latitude = "y"
    let z, s, c, sc: Int? //speed = “s”
}

// MARK: - Prms
struct Prms: Codable {
    let acc, accX, accY, accZ: AIn?
    let accTrigger, adc1, adc11, adc12: AIn?
    let adc13, adc14, adc2, adc3: AIn?
    let adc4, adc9, devStatus, gsmStatus: AIn?
    let hdop, prmsIn, in1, in10: AIn?
    let in11, in12, in13, in14: AIn?
    let in15, in16, in17, in18: AIn?
    let in19, in2, in20, in21: AIn?
    let in22, in23, in24, in25: AIn?
    let in26, in27, in28, in29: AIn?
    let in3, in30, in31, in32: AIn?
    let in4, in5, in6, in7: AIn?
    let in8, in9, out, out1: AIn?
    let out10, out11, out12, out13: AIn?
    let out14, out15, out16, out17: AIn?
    let out18, out19, out2, out20: AIn?
    let out21, out22, out23, out24: AIn?
    let out25, out26, out27, out28: AIn?
    let out29, out3, out30, out31: AIn?
    let out32, out4, out5, out6: AIn?
    let out7, out8, out9: AIn?
    let posinfo: Posinfo?
    let pwrEXT, pwrInt, recSn, soft: AIn?
    let speed, tempInt, valid, canA0: AIn?
    let canA1, canB0, canB1, fuelLevel: AIn?
    let gprsAnswer: GPRSAnswer?
    let taho, tempAqua, adc10, gsm: AIn?
    let io1, io17, io18, io19: AIn?
    let io21, io239, io240, io6: AIn?
    let io66, io67, io9: AIn?
    let text: GPRSAnswer?
    let cellID, gsmSt, hs: AIn?
    let iccid1: GPRSAnswer?
    let icctagNum1, icctagNum2, lac, mcc: AIn?
    let mnc, mw, navSt, pwrIn: AIn?
    let simIn, simT, st0, st1: AIn?
    let st2, unitTagNum, wlnAccelMax, wlnBrkMax: AIn?
    let wlnCrnMax, temp127, aIn, flags: AIn?
    
    enum CodingKeys: String, CodingKey {
        case acc, accX, accY, accZ
        case accTrigger = "acc_trigger"
        case adc1, adc11, adc12, adc13, adc14, adc2, adc3, adc4, adc9
        case devStatus = "dev_status"
        case gsmStatus = "gsm_status"
        case hdop
        case prmsIn = "in"
        case in1, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in2, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in3, in30, in31, in32, in4, in5, in6, in7, in8, in9, out, out1, out10, out11, out12, out13, out14, out15, out16, out17, out18, out19, out2, out20, out21, out22, out23, out24, out25, out26, out27, out28, out29, out3, out30, out31, out32, out4, out5, out6, out7, out8, out9, posinfo
        case pwrEXT = "pwr_ext"
        case pwrInt = "pwr_int"
        case recSn = "rec_sn"
        case soft, speed
        case tempInt = "temp_int"
        case valid
        case canA0 = "can_a0"
        case canA1 = "can_a1"
        case canB0 = "can_b0"
        case canB1 = "can_b1"
        case fuelLevel = "fuel_level"
        case gprsAnswer = "gprs_answer"
        case taho
        case tempAqua = "temp_aqua"
        case adc10, gsm
        case io1 = "io_1"
        case io17 = "io_17"
        case io18 = "io_18"
        case io19 = "io_19"
        case io21 = "io_21"
        case io239 = "io_239"
        case io240 = "io_240"
        case io6 = "io_6"
        case io66 = "io_66"
        case io67 = "io_67"
        case io9 = "io_9"
        case text
        case cellID = "cell_id"
        case gsmSt = "gsm_st"
        case hs
        case iccid1 = "iccid_1"
        case icctagNum1 = "icctag_num_1"
        case icctagNum2 = "icctag_num_2"
        case lac, mcc, mnc, mw
        case navSt = "nav_st"
        case pwrIn = "pwr_in"
        case simIn = "sim_in"
        case simT = "sim_t"
        case st0, st1, st2
        case unitTagNum = "unit_tag_num"
        case wlnAccelMax = "wln_accel_max"
        case wlnBrkMax = "wln_brk_max"
        case wlnCrnMax = "wln_crn_max"
        case temp127
        case aIn = "a_in"
        case flags
    }
}

// MARK: - AIn
struct AIn: Codable {
    let v: Double?
    let ct, at: Int?
}

// MARK: - GPRSAnswer
struct GPRSAnswer: Codable {
    let v: String?
    let ct, at: Int?
}

// MARK: - Posinfo
struct Posinfo: Codable {
    let v: VClass?
    let ct, at: Int?
}

// MARK: - Prp
struct Prp: Codable {
    let idrive, imgRot, sensorsColorsID, trackSpeed: String?
    let tripColors, useSensorColor, implock, monitoringSensorID: String?
    let motionStateSensorID, monitoringSensor, speedColors, trackSolid: String?
    
    enum CodingKeys: String, CodingKey {
        case idrive
        case imgRot = "img_rot"
        case sensorsColorsID = "sensors_colors_id"
        case trackSpeed = "track_speed"
        case tripColors = "trip_colors"
        case useSensorColor = "use_sensor_color"
        case implock
        case monitoringSensorID = "monitoring_sensor_id"
        case motionStateSensorID = "motion_state_sensor_id"
        case monitoringSensor = "monitoring_sensor"
        case speedColors = "speed_colors"
        case trackSolid = "track_solid"
    }
}


//------------------------------------------
// MARK: -sensors
//------------------------------------------
struct Sen: Codable {
    let id: Int?
    let n, t: String?
    let d: D?
    let m, p: String?
    let f: Int?
    let c: String?
    let vt, vs: Int?
    let tbl: [Tbl]?
}

enum D: String, Codable {
    case empty = ""
    case weightSensor = "weight sensor"
}

// MARK: - Tbl
struct Tbl: Codable {
    let x: Int?
    let a, b: Double?
}

// MARK: - SearchSpec
struct SearchSpec: Codable {
    let itemsType, propName, propValueMask, sortType: String?
    let propType, orLogic: String?
    
    enum CodingKeys: String, CodingKey {
        case itemsType, propName, propValueMask, sortType, propType
        case orLogic = "or_logic"
    }
}
