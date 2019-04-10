//
//  APIRequest.swift
//  Solstice-iOS-Contact
//
//  Created by Md Adit Hasan on 4/10/19.
//  Copyright © 2019 Md Adit Hasan. All rights reserved.
//

import Foundation

public final class APIRequest {
    private let configurator: RequestConfigurator
    
    public init(configurator: RequestConfigurator) {
        self.configurator = configurator
    }
    
    public func make(_ completion: @escaping (AnyObject?, Error?) -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            APIClient.dataTaskExecute(request: self.configurator.buildRequest()) { (data, response, error) in
                completion(self.makeModelFromJSON(data), nil)
            }
        }
    }
    
    
    static func makeDirect(request:URLRequest, completion: @escaping (Data?, Error?) -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            APIClient.dataTaskExecute(request: request) { (data, response, error) in
                DispatchQueue.main.async {
                     completion(data, error)
                }
            }
        }
    }
    
    private func makeModelFromJSON(_ data: Data?) -> AnyObject? {
        guard let jsonData = data else { return nil }
        
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [.allowFragments, .mutableLeaves, .mutableContainers])
            return jsonObject as AnyObject
            
        } catch {
            //TODO: LOG..
            print(error)
        }
        
        return nil
    }
}
