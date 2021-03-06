//
//  WSDataStream.swift
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/03/10.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

import Foundation
import WonderSenseLib_Filter

// MARK: Type
protocol WSDataStreamType {
    
    func setRawDataCB(cbFunc: () -> Void)
    func setFilteredDataCB(filter: WSFilterType, cbFunc: () -> Void)
    func receiveData(data: RawData)
}

final class WSDataStream: WSDataStreamType {
    
    func setRawDataCB(cbFunc: () -> Void) {
        
    }
    
    func setFilteredDataCB(filter: WSFilterType, cbFunc: () -> Void) {
        
    }
    
    func receiveData(data: RawData) {
        
    }
}
