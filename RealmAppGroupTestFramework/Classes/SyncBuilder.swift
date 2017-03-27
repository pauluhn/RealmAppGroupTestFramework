//
//  SyncBuilder.swift
//  Pods
//
//  Created by Paul Uhn on 3/27/17.
//
//

import Foundation
import SwiftyJSON

struct SyncBuilder {
    static func build(_ data: Any) -> [SyncModel] {
        print(#function)
        let json = JSON(data)
        guard let array = json["group"]["members"].array else { return [] }
        return array.map {
            SyncModel(id: $0["memberId"].string ?? UUID().uuidString,
                      name: $0["displayName"].string ?? UUID().uuidString)
            
        }
    }
}
