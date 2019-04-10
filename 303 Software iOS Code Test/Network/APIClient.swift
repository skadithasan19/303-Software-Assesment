//
//  APIError.swift
//  Solstice-iOS-Contact
//
//  Created by Md Adit Hasan on 4/10/19.
//  Copyright © 2019 Md Adit Hasan. All rights reserved.
//


import Foundation

typealias APIHandler = (Data?, URLResponse?, Error?) -> Swift.Void
typealias DownloadHandler = (URL?, URLResponse?, Error?) -> Swift.Void

final class APIClient: NSObject {
    
    private static let shared = APIClient()
    
    private let operationQueue: OperationQueue
    
    private let session: URLSession
    private let backgroundSession: URLSession
    
    private override init() {
        
        self.operationQueue = OperationQueue()
        self.operationQueue.maxConcurrentOperationCount = 10
        
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        
        self.session = URLSession(configuration: configuration, delegate: nil, delegateQueue: self.operationQueue)
        self.session.sessionDescription = "session.data"
        
        let bgConfiguration = URLSessionConfiguration.background(withIdentifier: "configuration.bg")
        configuration.allowsCellularAccess = true
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        
        self.backgroundSession = URLSession(configuration: bgConfiguration, delegate: nil, delegateQueue: self.operationQueue)
        self.backgroundSession.sessionDescription = "session.bg"
        
        super.init()
    }
    
    class func dataTaskExecute(request: URLRequest, apiHandler: @escaping APIHandler) {
        let dataTask = APIClient.shared.session.dataTask(with: request, completionHandler: apiHandler)
        dataTask.resume()
    }
    
    class func downloadTaskExecute(request: URLRequest, downloadHandler: @escaping DownloadHandler) {
        let downloadTask = APIClient.shared.backgroundSession.downloadTask(with: request, completionHandler: downloadHandler)
        downloadTask.resume()
    }
}
