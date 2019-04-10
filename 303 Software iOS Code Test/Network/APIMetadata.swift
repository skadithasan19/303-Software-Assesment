//
//  APIMetadata.swift
//  giftregistry2014
//
//  Created by Siddhpura, Dharmesh on 11/15/17.
//  Copyright © 2017 Crate&Barrel. All rights reserved.
//

import Foundation

@objc public class APIError: NSObject, Error, LocalizedError {
    //syncrionized - cm
    //syncronized array - mc
}

@objc public class APIResult: NSObject {
    
    //MJK - class for error
    let value: Any?
    let error: Error?
    
    init(value: Any?) {
        self.value = value
        self.error = nil
        
        super.init()
    }
    
    init(error: Error?) {
        self.error = error
        self.value = nil
        
        super.init()
    }
}
