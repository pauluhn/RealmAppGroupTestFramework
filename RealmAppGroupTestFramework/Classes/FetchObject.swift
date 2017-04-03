//
//  FetchObject.swift
//  Pods
//
//  Created by Paul Uhn on 4/3/17.
//
//

import Foundation
import RealmSwift

public class FetchObject {
    public let results: Results<SyncModel>?
    private var token: NotificationToken?
    
    public init(notificationBlock: CompletionBlock?) {
        results = SyncFetch.fetch()
        guard let _ = notificationBlock else { return }
        token = results?.addNotificationBlock { change in
            switch change {
            case .initial: break
            case .update: notificationBlock?()
            case .error(let e): print(e.localizedDescription)
            }
        }
    }
    deinit {
        token?.stop()
        token = nil
    }
}
