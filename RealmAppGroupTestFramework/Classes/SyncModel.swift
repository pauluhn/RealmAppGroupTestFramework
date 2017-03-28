//
//  SyncModel.swift
//  Pods
//
//  Created by Paul Uhn on 3/27/17.
//
//

import Foundation
import RealmSwift

public class SyncModel: Object {
    public dynamic var id = ""
    public dynamic var name = ""
    public override static func primaryKey() -> String? { return "id" }
    convenience init(id: String, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
}
