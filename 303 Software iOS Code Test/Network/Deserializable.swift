//
//  Deserializable.swift
//  Solstice-iOS-Contact
//
//  Created by Md Adit Hasan on 4/10/19.
//  Copyright © 2019 Md Adit Hasan. All rights reserved.
//

import Foundation

public typealias JSONDictionary = [String: Any]

@objc public protocol Deserializable {
    //Intentionally made this as 'Any' because some API returns anyObject instead of Dictionary
    init?(object: Any, baseValues: [String: Any]?)
    
    static func toArray(from object: Any?, baseValues:[String: Any]?) -> [Deserializable]
    static func parseError(for json: JSONDictionary) -> APIError
    static func parseError(by key: String) -> APIError
}
