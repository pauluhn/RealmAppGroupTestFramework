//
//  SyncTransaction.swift
//  Pods
//
//  Created by Paul Uhn on 3/27/17.
//
//

import Foundation
import RealmSwift

typealias TransactionBlock = (Realm) -> Void

struct SyncTransaction {
    let transactionBlock: TransactionBlock
    let completionBlock: CompletionBlock?
    init(models: [SyncModel], completion: CompletionBlock?) {
        transactionBlock = { realm in realm.add(models, update: true) }
        completionBlock = completion
    }
    func perform() {
        print(#function)
        do {
            let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.blackelephants.RealmAppGroupTest").map { $0.appendingPathComponent("default.realm") }
            let config = Realm.Configuration(fileURL: url, deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: config)
            try realm.write {
                transactionBlock(realm)
            }
            completionBlock?()
        } catch {
            print(error.localizedDescription)
        }
    }
}
