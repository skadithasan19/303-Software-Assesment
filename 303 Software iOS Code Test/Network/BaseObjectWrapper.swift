//
//  BaseObjectWrapper.swift
//  Solstice-iOS-Contact
//
//  Created by Md Adit Hasan on 4/10/19.
//  Copyright © 2019 Md Adit Hasan. All rights reserved.
//

import Foundation

protocol BaseObjectWrapper: Deserializable {
    associatedtype T: Deserializable
    var object: [T] { get set }
}
