//
//  ViewController.swift
//  WSK-Demo
//
//  Created by Eita Yamaguchi on 2020/07/24.
//  Copyright © 2020 WonderWonder. All rights reserved.
//

import UIKit
import CoreBluetooth
import WonderSenseKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var logTextView: UITextView!
    
    // MARK: Properties
    
    private var ws: WSBLE?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        connectButton.isEnabled = false
        connectButton.alpha = 0.5
        
        scanButton.addTarget(self, action: #selector(switchScan), for: .touchDown)
        connectButton.addTarget(self, action: #selector(switchConnect), for: .touchDown)
    }

    func foundCB(instance: WSBLE) {
        
        self.ws = instance
        connectButton.isEnabled = true
        connectButton.alpha = 1.0
        
        debugPrint("[Demo] Found! -> \(instance.peripheral?.name ?? "Unknown")")
        logTextView.addText(text: "[Demo] Found! -> \(instance.peripheral?.name ?? "Unknown")")
    }
    
    @objc func switchScan() {
        
        if !WSBLE.isFinding {
            
            WSBLE.startFind(cbFunc: foundCB)
            scanButton.setTitle("Stop Scan", for: .normal)

            logTextView.addText(text: "[Demo] Start Find WS")
            debugPrint("[Demo] Start Find WS")
        } else {
            
            WSBLE.stopFind()
            scanButton.setTitle("Start Scan", for: .normal)

            logTextView.addText(text: "[Demo] Stop Find WS")
            debugPrint("[Demo] Stop Find WS")
        }
    }
    
    
    func connectionCB(status: BLEConnectionStatus) {
        
        if status.isSuccess {

            connectButton.setTitle("Disconnect", for: .normal)
            
            debugPrint("[Demo] Successful! -> \(status.peripheral.name ?? "Unknown")")
            logTextView.addText(text: "[Demo] Successful! -> \(status.peripheral.name ?? "Unknown")")
        } else {

            connectButton.setTitle("Connect", for: .normal)

            debugPrint("[Demo] Failure! -> \(status.peripheral.name ?? "Unknown")")
            logTextView.addText(text: "[Demo] Failure! -> \(status.peripheral.name ?? "Unknown")")
        }
    }

    @objc func switchConnect() {
        
        if let ws = self.ws, !ws.isConnecting {
            
            ws.connect(cbFunc: connectionCB)

            logTextView.addText(text: "[Demo] Connecting to \(ws.peripheral?.name ?? "Unknown")")
            debugPrint("[Demo] Connecting to \(ws.peripheral?.name ?? "Unknown")")
        } else if let ws = self.ws, ws.isConnecting {
            
            ws.disconnect(cbFunc: connectionCB)

            logTextView.addText(text: "[Demo] Disconnecting from \(ws.peripheral?.name ?? "Unknown")")
            debugPrint("[Demo] Disconnecting from \(ws.peripheral?.name ?? "Unknown")")
        }
    }
}
