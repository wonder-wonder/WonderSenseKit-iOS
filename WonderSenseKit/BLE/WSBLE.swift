//
//  WSBLE.swift
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/03/10.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

import Foundation
import CoreBluetooth

// MARK: WSBLE Type

protocol WSBLEType {

    // TODO: Summarize public function and properties with permission

    static func startFind(cbFunc: @escaping (WSBLE) -> Void)
    static func stopFind()
    func connect(cbFunc: @escaping (BLEConnectionStatus) -> Void)
    func disconnect(cbFunc: @escaping (BLEConnectionStatus) -> Void)
    func startDataStream(cbFunc: () -> Void)
    func stopDataStream(cbFunc: () -> Void)
    func settings(data: [String: Int])
    func sleep()
    func reboot()
}

public class WSBLE: WSBLEType {

    // MARK: Public Static Properties
    
    public static var isFinding = false

    // MARK: Public Static Functions

    public static func startFind(cbFunc: @escaping (_ instance: WSBLE) -> Void) {

        foundCB = cbFunc
        isFinding = true
        find()
    }
    
    public static func stopFind() {
        
        centralManager.stopScan()
        isFinding = false
        foundCB = nil
    }

    // MARK: Private Static Properties
    
    private static let centralManager = CBCentralManager(delegate: WSBLEScanner.shared, queue: nil)
    static var foundCB: ((_ instance: WSBLE) -> Void)?
    static var changeConnectionStatus: ((_ type: BLEConnectionType, _ status: BLEConnectionStatus) -> Void)?
    static var connectCB: ((_ status: BLEConnectionStatus) -> Void)?
    static var disconnectCB: ((_ status: BLEConnectionStatus) -> Void)?

    // MARK: Private Static Functions

    static func find() {
        
        guard isFinding, centralManager.state == .poweredOn else { return }
//        centralManager.scanForPeripherals(withServices: WSBLEProfile.services, options: nil)
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }

    static func discoveredPeripheral(peripheral: CBPeripheral) {
        
        foundCB?(WSBLE(peripheral: peripheral))
    }

    // MARK: Public Properties

    public var peripheral: CBPeripheral? {

        return self._peripheral
    }
    
    public var isConnecting: Bool {

        return self._isConnecting
    }
    
    // MARK: Private Properties
    
    private let _peripheral: CBPeripheral?
    private var _isConnecting: Bool = false
    private let _ble: WSBLEGattType

    // MARK: Initialize
    
    init(
        peripheral: CBPeripheral,
        ble: WSBLEGattType = WSBLEGatt()
    ) {
        self._peripheral = peripheral
        self._ble = ble
    }
    
    // MARK: Private Functions
    
    private func changeConnectionStatus(_ type: BLEConnectionType, with status: BLEConnectionStatus) {
        
        if type == .connect {
            
            if status.isSuccess {
                self._isConnecting = true
            }
            WSBLE.connectCB?(status)
        }
        if type == .disConnect {
            
            self._isConnecting = false
            WSBLE.disconnectCB?(status)
        }
    }
    
    // MARK: Public Functions
    
    public func connect(cbFunc: @escaping (_ status: BLEConnectionStatus) -> Void) {
        
        WSBLE.changeConnectionStatus = changeConnectionStatus(_:with:)
        WSBLE.connectCB = cbFunc
        
        guard let peripheral = self._peripheral else { return }
        WSBLE.centralManager.connect(peripheral, options: nil)
    }

    public func disconnect(cbFunc: @escaping (_ status: BLEConnectionStatus) -> Void) {

        WSBLE.changeConnectionStatus = changeConnectionStatus(_:with:)
        WSBLE.disconnectCB = cbFunc
        
        guard let peripheral = self._peripheral else { return }
        WSBLE.centralManager.cancelPeripheralConnection(peripheral)
    }
    
    public func startDataStream(cbFunc: () -> Void) {
        
    }
    
    public func stopDataStream(cbFunc: () -> Void) {
        
    }
    
    public func settings(data: [String: Int]) {
        
    }
    
    public func sleep() {
        
    }
    
    public func reboot() {
        
    }
}
