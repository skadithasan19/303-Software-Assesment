//
//  Contact.swift
//  Solstice-iOS-Contact
//
//  Created by Md Adit Hasan on 4/10/19.
//  Copyright © 2019 Md Adit Hasan. All rights reserved.
//

import UIKit


//enum PhoneType : String {
//    case Work = "work", Home = "home", Mobile = "mobile"
//    static let allValues = [Work, Home, Mobile]
//}

class ContactWrapper:NSObject {
    
    var objects: [Contact]?
    init(jsonObject: AnyObject?) {
        if let tempArr = jsonObject as? [[String:Any]] {
            self.objects = tempArr.compactMap({ Contact(json: $0)})
        }  else {
            self.objects = nil
        }
        super.init()
    }
}

class Contact: PropertyNames {

    var fname:String!
    var lname:String!
    var city:String!
 
    
    @objc init(json: [String: Any]) {
        self.fname = json["fname"] as? String ?? ""
        self.lname = json["lname"] as? String ?? ""
        self.city = json["city"] as? String ?? ""
    }

}


class ContactType: NSObject {
    var contacts:Dictionary<Bool, [Contact]>
    init(data:Dictionary<Bool, [Contact]>) {
        contacts = data
    }
}

protocol PropertyNames {
    func propertyNames() -> [String]
}

extension PropertyNames
{
    func propertyNames() -> [String] {
        return Mirror(reflecting: self).children.compactMap { $0.label }
    }
    
    func isNilDescendant(_ any: Any?) -> Bool {
        return String(describing: any) == "Optional(nil)"
    }
    
    func valueFor(property:String) -> Any? {
        let mirror = Mirror(reflecting: self)
        if let child = mirror.descendant(property), !isNilDescendant(child) {
            return child
        }
        else {
            return nil
        }
    }
}
