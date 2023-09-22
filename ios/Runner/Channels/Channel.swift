//
//  Channel.swift
//  Runner
//
//  Created by Shubham Rao on 22/09/23.
//

import Foundation
import Flutter

class Channel{
    
    //var CHANNEL_ID : String =  "channels/main"
    
    static func platformEngine(controller: FlutterViewController,context: AppDelegate){
         
         let platformChannel = FlutterMethodChannel(name: "channels/main", binaryMessenger: controller.binaryMessenger)

         platformChannel.setMethodCallHandler { [weak context] (call: FlutterMethodCall, result: @escaping FlutterResult) in
             
           if call.method == "apiKey" {
             // Implement your native code logic here
               let nativeResult = Bundle.main.infoDictionary?["API_KEY"] as? String
             result(nativeResult)
           } else {
             result(FlutterMethodNotImplemented)
           }
         }
        
    }
}
