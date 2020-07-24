//
//  WSFKF.swift
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/03/10.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

import Foundation

final class WSFKF {
    
    private let _length = 4
    private var _staticCorrectionParam: StaticCorrectionResult?
    private var _dynamicCorrectionParam: DynamicCorrectionResult?
    
    func setStaticCorrectionParam(_ params: StaticCorrectionResult!) {
        
        self._staticCorrectionParam = params
    }
    
    func setDynamicCorrectionParam(_ params: DynamicCorrectionResult!) {
        
        self._dynamicCorrectionParam = params
    }

    func getStaticCorrectionParam() throws -> StaticCorrectionResult {
        
        guard self._staticCorrectionParam != nil else {
            throw paramError.notset
        }
        return self._staticCorrectionParam!
    }

    func getDynamicCorrectionParam() throws -> DynamicCorrectionResult {
        
        guard self._dynamicCorrectionParam != nil else {
            throw paramError.notset
        }
        return self._dynamicCorrectionParam!
    }
    
    func dynamicCorrection(_ dataList: [RawData]) {
        //        Sensor Dynamic Parameter Correction
//        self._dynamicCorrectionParam = dynamicCorrection(dataList)
    }
    
    func staticCorrection(_ dataList: [RawData]) {
        //        Sensor Static Parameter Correction
//        self._staticCorrectionParam = staticCorrection(dataList, self._length)
    }
    
}
