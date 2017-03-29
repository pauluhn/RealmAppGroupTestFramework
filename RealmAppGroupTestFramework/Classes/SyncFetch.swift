//
//  SyncFetch.swift
//  Pods
//
//  Created by Paul Uhn on 3/28/17.
//
//

import Foundation
import RealmSwift

public struct SyncFetch {
    public static func fetch() -> Results<SyncModel>? {
        do {
            let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.blackelephants.RealmAppGroupTest").map { $0.appendingPathComponent("default.realm") }
            let config = Realm.Configuration(fileURL: url, deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: config)
            return realm.objects(SyncModel.self)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    public static func otherFetch(completion: CompletionBlock?) {
        do {
            let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.blackelephants.RealmAppGroupTest").map { $0.appendingPathComponent("default.realm") }
            let config = Realm.Configuration(fileURL: url, deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: config)
            _ = realm.objects(OtherModel.self)
            completion?()
        } catch {
            print(error.localizedDescription)
        }
    }
}
