//
//  WSBLEScanner.swift
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/05/31.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

import Foundation
import CoreBluetooth

// MARK: WSBLEScanner

final class WSBLEScanner: NSObject, CBCentralManagerDelegate {

    static let shared = WSBLEScanner()
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {

        switch central.state {
        case .poweredOff:
            debugPrint("[WS_SDK] Bluetooth PoweredOff")
        case .poweredOn:
            debugPrint("[WS_SDK] Bluetooth poweredOn")
        case .resetting:
            debugPrint("[WS_SDK] Bluetooth resetting")
        case .unauthorized:
            debugPrint("[WS_SDK] Bluetooth unauthorized")
        case .unknown:
            debugPrint("[WS_SDK] Bluetooth unknown")
        case .unsupported:
            debugPrint("[WS_SDK] Bluetooth unsupported")
        default:
            debugPrint("[WS_SDK] Bluetooth default")
        }
        
        WSBLE.find()
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {

        debugPrint("[WS_SDK] \(peripheral)")
        guard let pName = peripheral.name, pName == WSBLEProfile.V1Profile.name else { return }
        WSBLE.discoveredPeripheral(peripheral: peripheral)
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        
        WSBLE.changeConnectionStatus?(.connect, .success(peripheral: peripheral))
    }

    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {

        WSBLE.changeConnectionStatus?(.connect, .fail(peripheral: peripheral, error: error))
    }

    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {

        if let error = error {
            WSBLE.changeConnectionStatus?(.disConnect, .fail(peripheral: peripheral, error: error))
            return
        }
        WSBLE.changeConnectionStatus?(.disConnect, .success(peripheral: peripheral))
    }
}
