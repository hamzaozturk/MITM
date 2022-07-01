//
//  Network.swift
//  MITM
//
//  Created by Hamza Öztürk on 6.03.2022.
//

import SwiftUI

class Network: NSObject, ObservableObject {
    
    func requestHttp(overrideProxy: Bool = false) async -> String? {
        guard
            let url = URL(string: "http://httpbin.org/anything")
        else {
            return nil
        }
                
        let sessionConfig = URLSessionConfiguration.default
        
        if overrideProxy {
            sessionConfig.connectionProxyDictionary = [:]
        }
        
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: OperationQueue.current)
        
        do {
            let (data, _) = try await session.data(from: url)
            return String(data: data, encoding: .utf8)
        } catch {
            print("Invalid data")
        }
        
        return nil
    }
    
    func requestHttps(overrideProxy: Bool = false) async -> String? {
        guard
            let url = URL(string: "https://httpbin.org/anything")
        else {
            return nil
        }
                
        let sessionConfig = URLSessionConfiguration.default
        
        if overrideProxy {
            sessionConfig.connectionProxyDictionary = [:]
        }
        
        let session = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: OperationQueue.current)
        
        do {
            let (data, _) = try await session.data(from: url)
            return String(data: data, encoding: .utf8)
        } catch {
            print("Invalid data")
        }
        
        return nil
    }
}

extension Network: URLSessionDelegate {
//    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
//
//        completionHandler(.useCredential, urlCredential)
//    }
}
