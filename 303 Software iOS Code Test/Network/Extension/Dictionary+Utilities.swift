//
//  Dictionary+Utilities.swift
//  Solstice-iOS-Contact
//
//  Created by Md Adit Hasan on 4/10/19.
//  Copyright © 2019 Md Adit Hasan. All rights reserved.
//


extension Dictionary where Key == String {
    func valueForKeyPath(_ keyPath: String) -> Any? {
        
        let components = keyPath.components(separatedBy: ".")
        
        guard let key = components.first else { return nil }
        
        guard components.count > 1 else {
            return self[key]
        }
        
        guard let nextJSON = self[key] as? JSONDictionary else { return nil }
        
        var temp = components
        temp.removeFirst()
        
        return nextJSON.valueForKeyPath(temp.joined(separator: "."))
    }
}
