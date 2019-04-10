//
//  RequestConfigurator.swift
//  Solstice-iOS-Contact
//
//  Created by Md Adit Hasan on 4/10/19.
//  Copyright © 2019 Md Adit Hasan. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get, post, put, patch, delete
}

public enum HTTPProtocol: String {
    case http, https
}

public protocol RequestConfigurator {
    
    var baseURL: URL? { get }
    var httpMethod: HTTPMethod { get }
    var httpProtocol: HTTPProtocol { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var bodyParameters: [String: Any]? { get }
    var body: Data? { get }
    var headers: [String: String]? { get }
    
    var cachePolicy: URLRequest.CachePolicy { get }
    var timeoutInterval: TimeInterval { get }
    
    func buildRequest() -> URLRequest
}

extension RequestConfigurator {
    
    var baseURL: URL? {
        var urlComponents = URLComponents(string: self.httpProtocol.rawValue + "://" + self.host + self.path)
        urlComponents?.queryItems = self.queryItems
        
        return urlComponents?.url
    }
    
    var host: String {
        return "iosventure.com" // My domain
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    var bodyParameters: [String: Any]? {
        //TODO:generic property for body as a data
        return nil
    }
    
    var body: Data? {
        return nil
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var cachePolicy: URLRequest.CachePolicy {
        return .reloadIgnoringLocalCacheData
    }
    
    var timeoutInterval: TimeInterval {
        return 60
    }
    
    func buildRequest() -> URLRequest {
        //TODO: Check and throw
        var request = URLRequest(url: self.baseURL!, cachePolicy: self.cachePolicy, timeoutInterval: self.timeoutInterval)
        request.httpMethod = self.httpMethod.rawValue
        request.allHTTPHeaderFields = self.headers
        return request
    }
}
