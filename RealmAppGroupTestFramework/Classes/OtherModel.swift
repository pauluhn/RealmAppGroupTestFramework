//
//  OtherModel.swift
//  Pods
//
//  Created by Paul Uhn on 3/28/17.
//
//

import Foundation
import RealmSwift

public class OtherModel: Object {
    public dynamic var id = ""
    public dynamic var name = ""
    public override static func primaryKey() -> String? { return "id" }
    public convenience init(id: String, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
    public func save(completion: CompletionBlock?) {
        let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.blackelephants.RealmAppGroupTest").map { $0.appendingPathComponent("default.realm") }
        let config = Realm.Configuration(fileURL: url, deleteRealmIfMigrationNeeded: true)
        do {
            let realm = try Realm(configuration: config)
            try realm.write {
                realm.add(self, update: true)
            }
            completion?()
        } catch {
            print(error.localizedDescription)
        }
    }
    public func otherRealmSave(completion: CompletionBlock?) {
        let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.blackelephants.RealmAppGroupTest").map { $0.appendingPathComponent("other.realm") }
        let config = Realm.Configuration(fileURL: url, deleteRealmIfMigrationNeeded: true)
        do {
            let realm = try Realm(configuration: config)
            try realm.write {
                realm.add(self, update: true)
            }
            completion?()
        } catch {
            print(error.localizedDescription)
        }
    }
}
