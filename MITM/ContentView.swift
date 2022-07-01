//
//  ContentView.swift
//  MITM
//
//  Created by Hamza Öztürk on 6.03.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    @State private var overrideProxy = false

    var body: some View {
        List {
            Toggle("Override Proxy", isOn: $overrideProxy)
            Button("Request Http") {
                Task {
                    await network.requestHttp(overrideProxy: overrideProxy)
                }
            }
            Button("Request Https") {
                Task {
                    await network.requestHttps(overrideProxy: overrideProxy)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
