//
//  WSBLEModel.swift
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/06/06.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

import Foundation
import CoreBluetooth

// MARK: ConnectionStatus

public enum BLEConnectionType {
    
    case connect
    case disConnect
}

public enum BLEConnectionStatus {
    
    case success(peripheral: CBPeripheral)
    case fail(peripheral: CBPeripheral, error: Error?)
    
    public var isSuccess: Bool {
        
        switch self {
        case .success: return true
        case .fail: return false
        }
    }
    
    public var peripheral: CBPeripheral {
        
        switch self {
        case .success(let peripheral): return peripheral
        case .fail(let peripheral, _): return peripheral
        }
    }
    
    public var error: Error? {
        
        switch self {
        case .success:  return nil
        case .fail(_, let error): return error
        }
    }
}
