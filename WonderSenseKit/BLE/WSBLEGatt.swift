//
//  WSBLEGatt.swift
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/05/23.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

import Foundation
import CoreBluetooth

// MARK: - Main BLE Controller Type

protocol WSBLEGattType {

    var inputs: WSBLEGattInputs { get }
    var outputs: WSBLEGattOutputs { get }
}

protocol WSBLEGattInputs {

}

protocol WSBLEGattOutputs {

}

// MARK: - Extension WSBLEGattType

extension WSBLEGatt: WSBLEGattType {

    var inputs: WSBLEGattInputs { return self }
    var outputs: WSBLEGattOutputs { return self }
}

// MARK: - Main BLE Controller

final class WSBLEGatt: NSObject, WSBLEGattOutputs {

    // MARK: Outputs

    // MARK: Properties

    private var peripheralManager = CBPeripheralManager()

    // MARK: Initialize

    override init() {
        super.init()

        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
}

// MARK: - Extension WSBLEGattInputs

extension WSBLEGatt: WSBLEGattInputs {

}

// MARK: - Extension PeripheralManager Delegate

extension WSBLEGatt: CBPeripheralManagerDelegate {
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
    
    }
}

// MARK: - Extension Peripheral Delegate

extension WSBLEGatt: CBPeripheralDelegate {

    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        
    }
}
