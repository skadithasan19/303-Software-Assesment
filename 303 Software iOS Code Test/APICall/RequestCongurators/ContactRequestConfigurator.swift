//
//  ContactRequestConfigurator.swift
//  Solstice-iOS-Contact
//
//  Created by Md Adit Hasan on 4/10/19.
//  Copyright © 2019 Md Adit Hasan. All rights reserved.
//

import Foundation

struct ContactRequestConfigurator: RequestConfigurator {
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var httpProtocol: HTTPProtocol {
        return .http
    }
    
    var host: String {
        return "filltext.com"
    }
    
    var path: String {
        return "/"
    }
 
    var queryItems: [URLQueryItem]? {
        var queryItem = [URLQueryItem]()
        queryItem.append(URLQueryItem(name: "rows", value: "100"))
        queryItem.append(URLQueryItem(name: "fname", value: "{firstName}"))
        queryItem.append(URLQueryItem(name: "lname", value: "{lastName}"))
        queryItem.append(URLQueryItem(name: "city", value: "{city}"))
        queryItem.append(URLQueryItem(name: "pretty", value: "true"))
        return queryItem
    }
}
