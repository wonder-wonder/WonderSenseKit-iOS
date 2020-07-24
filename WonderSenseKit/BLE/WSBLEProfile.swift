//
//  WSBLEModel.swift
//  WonderSenseKit
//
//  Created by Eita Yamaguchi on 2020/05/23.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

import Foundation
import CoreBluetooth


// MARK: - WSBLEProfile

enum WSBLEProfile {
    case v1, v2, unknown
    
    // MARK: Version1 Profiles
    
    enum V1Profile: String, CaseIterable {

        // MARK: Generic Service
        
        case genericService = "00002902-0000-1000-8000-00805f9b34fb"
        
        // MARK: Sensor Data Service

        case dataService = "F0001110-0451-4000-B000-000000000000"
        case motionData = "F0002EA1-0451-4000-B000-000000000000"
        
        // MARK: Sensor Device Information Service
        
        case deviceInfoService = "0000180A-0000-1000-8000-00805F9B34FB"
        case manufactureName = "00002A29-0000-1000-8000-00805F9B34FB"
        case hardwareRevision = "00002A27-0000-1000-8000-00805F9B34FB"
        case firmwareRevision = "00002A26-0000-1000-8000-00805F9B34FB"
        case systemId = "00002A23-0000-1000-8000-00805F9B34FB"
        
        // MARK: Sensor Manager Service

        case managerService = "F000EA8E-0451-4000-B000-000000000000"
        case save = "F0002FAF-0451-4000-B000-000000000000"
        case running = "F0006EF5-0451-4000-B000-000000000000"
        case mpuFrequency = "F0002698-0451-4000-B000-000000000000"
        case compassFrequency = "F000B39A-0451-4000-B000-000000000000"
        case selfTest = "F0001E89-0451-4000-B000-000000000000"
        case lowpassFilter = "F0006C54-0451-4000-B000-000000000000"
        case accFsr = "F0004C4A-0451-4000-B000-000000000000"
        case gyroFsr = "F000E4FF-0451-4000-B000-000000000000"
        case reboot = "F000C048-0451-4000-B000-000000000000"
        case sleep  = "F0000F73-0451-4000-B000-000000000000"
        case magCoef = "F00007F3-0451-4000-B000-000000000000"
        case unknown = ""
        
        static var name: String {

            return "WonderSense_v1"
        }
    }
    
    // MARK: Version2 Profiles
    
    enum V2Profile: String, CaseIterable {

        // MARK: Generic Service
        
        case genericService = "00002902-0000-1000-8000-00805f9b34fb"
        
        // MARK: Sensor Data Service

        case dataService = "F0001110-0451-4000-B000-000000000000"
        case motionData = "F0002EA1-0451-4000-B000-000000000000"
        
        // MARK: Sensor Device Information Service
        
        case deviceInfoService = "0000180A-0000-1000-8000-00805F9B34FB"
        case manufactureName = "00002A29-0000-1000-8000-00805F9B34FB"
        case hardwareRevision = "00002A27-0000-1000-8000-00805F9B34FB"
        case firmwareRevision = "00002A26-0000-1000-8000-00805F9B34FB"
        case systemId = "00002A23-0000-1000-8000-00805F9B34FB"
        
        // MARK: Sensor Manager Service

        case managerService = "F000EA8E-0451-4000-B000-000000000000"
        case save = "F0002FAF-0451-4000-B000-000000000000"
        case running = "F0006EF5-0451-4000-B000-000000000000"
        case mpuFrequency = "F0002698-0451-4000-B000-000000000000"
        case compassFrequency = "F000B39A-0451-4000-B000-000000000000"
        case selfTest = "F0001E89-0451-4000-B000-000000000000"
        case lowpassFilter = "F0006C54-0451-4000-B000-000000000000"
        case accFsr = "F0004C4A-0451-4000-B000-000000000000"
        case gyroFsr = "F000E4FF-0451-4000-B000-000000000000"
        case reboot = "F000C048-0451-4000-B000-000000000000"
        case sleep  = "F0000F73-0451-4000-B000-000000000000"
        case magCoef = "F00007F3-0451-4000-B000-000000000000"
        case unknown = ""
        
        static var name: String {

            return "WonderSense_v2"
        }
    }

    // MARK: Initialize
    
    init(uuid: CBUUID) {
        
        let v1Services = V1Profile.allCases
            .filter { (sv) -> Bool in sv.rawValue == uuid.uuidString }
        
        guard v1Services.count == 0 else {
            self = .v1
            return
        }
        
        let v2Services = V2Profile.allCases
            .filter { (sv) -> Bool in sv.rawValue == uuid.uuidString }
        
        guard v2Services.count == 0 else {
            self = .v2
            return
        }
        
        self = .unknown
    }
    
    init(name: String) {

        switch name {
        case V1Profile.name: self = .v1
        case V2Profile.name: self = .v2
        default: self = .unknown
        }
    }

    // MARK: Services
    
    var services: [String: CBUUID] {
        
        switch self {
        case .v1:
            var dict: [String: CBUUID] = .init()
            V1Profile.allCases.forEach {
                dict[String(describing: $0)] = CBUUID(string: $0.rawValue)
            }
            return dict
        case .v2:
            var dict: [String: CBUUID] = .init()
            V2Profile.allCases.forEach {
                dict[String(describing: $0)] = CBUUID(string: $0.rawValue)
            }
            return dict
        case .unknown:
            return [String: CBUUID]()
        }
    }
}
