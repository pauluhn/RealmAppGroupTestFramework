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
        do {
            let realm = try MyRealm.realm()
            try realm.write {
                transactionBlock(realm)
            }
            completionBlock?()
        } catch {
            print(error.localizedDescription)
        }
    }
}
