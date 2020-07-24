//
//  WSModel.swift
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/03/10.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

import Foundation

@objcMembers
final public class Quaternion: NSObject {

    var q0: Double = 0.0
    var q1: Double = 0.0
    var q2: Double = 0.0
    var q3: Double = 0.0
}

protocol FilterData: NSObject {
}

@objcMembers
final public class WSFilterResult: NSObject, FilterData {

    var ax: Double = 0.0
    var ay: Double = 0.0
    var az: Double = 0.0
    var gx: Double = 0.0
    var gy: Double = 0.0
    var gz: Double = 0.0
    var mx: Double = 0.0
    var my: Double = 0.0
    var mz: Double = 0.0
    var temperature: Double = 0.0
    var battery: Double = 0.0
    var airPressure: Double = 0.0
    var quaternion: Quaternion?
}
