//
//  SyncModel.swift
//  Pods
//
//  Created by Paul Uhn on 3/27/17.
//
//

import Foundation
import RealmSwift

class SyncModel: Object {
    dynamic var id = ""
    dynamic var name = ""
    override static func primaryKey() -> String? { return "id" }
    convenience init(id: String, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
}
