//
//  ViewController.swift
//  DsemDemoApp
//
//  Created by Vlad Pokryshka on 10/17/18.
//  Copyright © 2018 QuanTag IT Solutions. All rights reserved.
//

import UIKit
import LPALib

class ViewController: UIViewController, LpaEventListener {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testScript()
        
    }
    
    func testScript() {
        
        let lpaManager = LpaManager(lpaEventListener: self)
        let lpaManager = LpaManager(lpaEventListener: self, maxCommandChunkSize: 19)
        
        lpaManager.getEid()
//        let dsem = DsemController()
//        print("Version: \(dsem.getVersion())")
//        let scriptArray = TestScript().scriptArray
//        dsem.startApduScript(apduCount: scriptArray.count)
//        for command in TestScript().scriptArray {
//            let apduCmdResp = DsemApduCommand(apduCommand: command)
////            print("Original command: \(hexStringFromData(Data(apduCmdResp.getBytes())))")
//            var processedCmd = dsem.handleApduCommand(cmd: apduCmdResp)
//    
//            while processedCmd.getType() == DsemApduObject.ApduType.APDU_COMMAND {
//                print("APDU command: \(hexStringFromData(Data(processedCmd.getBytes())))")
//
//                let response = DsemApduResponse(apduResponse: TestScript.giveResponse(command: processedCmd.getBytes()))
//                print("APDU response: \(hexStringFromData(Data(response.getBytes())))")
//                processedCmd = dsem.handleApduResponse(rsp: response)
//                print("APDU script response: \(processedCmd.isScriptResponse)")
//            }
//            
//        }
    }
    
    func hexStringFromData(_ input: Data) -> String {
        let bytes = [UInt8](input)
        var hexString = ""
        for byte in bytes {
            hexString += String(format:"%02x", UInt8(byte))
        }
        
        return hexString
    }
    
}

