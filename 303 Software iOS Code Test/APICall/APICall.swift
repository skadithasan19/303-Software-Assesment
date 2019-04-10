//
//  APICall.swift
//  Solstice-iOS-Contact
//
//  Created by Md Adit Hasan on 4/10/19.
//  Copyright © 2019 Md Adit Hasan. All rights reserved.
//

import UIKit

class APICall: NSObject {

    // Load All Contacts
    static func GetContacts(completion: @escaping (_ contacts: [Contact]?) -> Void)  {
        APIRequest(configurator: ContactRequestConfigurator()).make { (respone, error) in
            DispatchQueue.main.async {
                completion(ContactWrapper(jsonObject: respone).objects)
            }
        }
    }
}
