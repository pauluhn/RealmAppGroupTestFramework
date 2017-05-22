//
//  RealmConfiguration.swift
//  Pods
//
//  Created by Paul Uhn on 5/22/17.
//
//

import Foundation
import RealmSwift

private var printUrl = true

struct MyRealm {
    static func realm() throws -> Realm {
        let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.blackelephants.RealmAppGroupTest").map { $0.appendingPathComponent("default.realm") }
        if printUrl {
            printUrl = false
            print(String(describing: url))
        }
        var config = Realm.Configuration()
        config.fileURL = url
        config.schemaVersion = version
        config.migrationBlock = block
        do {
            return try Realm(configuration: config)
        }
    }
    static var version: UInt64 {
        return 1
    }
    static var block: MigrationBlock {
        return { migration, oldVersion in
            if oldVersion < 1 {
                // blah
            }
        }
    }
}
