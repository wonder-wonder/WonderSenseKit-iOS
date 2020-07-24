//
//  WSFKFModel.swift
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/03/10.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

import Foundation

@objcMembers
final class StaticCorrectionResult: NSObject {
    
    var sigmaA: Double = 0.0
    var sigmaG: Double = 0.0
    var sigmaM: Double = 0.0
    var gx: Double = 0.0
    var gy: Double = 0.0
    var gz: Double = 0.0
}

@objcMembers
final class DynamicCorrectionResult: NSObject {
    
    var u: [Double] = []
    var mx: Double = 0.0
    var my: Double = 0.0
    var mz: Double = 0.0
}
