//
//  MITMApp.swift
//  MITM
//
//  Created by Hamza Öztürk on 6.03.2022.
//

import SwiftUI

@main
struct MITMApp: App {
    let network = Network()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
