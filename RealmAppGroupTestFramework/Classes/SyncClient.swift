//
//  SyncClient.swift
//  Pods
//
//  Created by Paul Uhn on 3/27/17.
//
//

import Foundation

public typealias CompletionBlock = () -> Void

public struct SyncClient {
    public static func sync(completion: CompletionBlock?) {
        print(#function)
        queue.async {
            var endpoints: [SyncEndpoint] = []
            endpoints.append(.first { sync(endpoint: endpoints[1]) })
            endpoints.append(.second { sync(endpoint: endpoints[2]) })
            endpoints.append(.third { sync(endpoint: endpoints[3]) })
            endpoints.append(.fourth { sync(endpoint: endpoints[4]) })
            endpoints.append(.fifth { sync(endpoint: endpoints[5]) })
            endpoints.append(.sixth { sync(endpoint: endpoints[6]) })
            endpoints.append(.seventh { sync(endpoint: endpoints[7]) })
            endpoints.append(.eighth { sync(endpoint: endpoints[8]) })
            endpoints.append(.ninth { sync(endpoint: endpoints[9]) })
            endpoints.append(.tenth { sync(endpoint: endpoints[10]) })
            endpoints.append(.eleventh { sync(endpoint: endpoints[11]) })
            endpoints.append(.twelfth { sync(endpoint: endpoints[12]) })
            endpoints.append(.thirteenth { sync(endpoint: endpoints[13]) })
            endpoints.append(.fourteenth { sync(endpoint: endpoints[14]) })
            endpoints.append(.fifteenth { completion?() })
            sync(endpoint: endpoints[0])
        }
    }

    private static let queue = DispatchQueue(label: "sync client queue", qos: .userInitiated)
    private enum SyncEndpoint {
        case first(completion: CompletionBlock)
        case second(completion: CompletionBlock)
        case third(completion: CompletionBlock)
        case fourth(completion: CompletionBlock)
        case fifth(completion: CompletionBlock)
        case sixth(completion: CompletionBlock)
        case seventh(completion: CompletionBlock)
        case eighth(completion: CompletionBlock)
        case ninth(completion: CompletionBlock)
        case tenth(completion: CompletionBlock)
        case eleventh(completion: CompletionBlock)
        case twelfth(completion: CompletionBlock)
        case thirteenth(completion: CompletionBlock)
        case fourteenth(completion: CompletionBlock)
        case fifteenth(completion: CompletionBlock)
    }
    private static func sync(endpoint: SyncEndpoint) {
        switch endpoint {
        case let .first(completion): first(completion: completion)
        case let .second(completion): second(completion: completion)
        case let .third(completion): third(completion: completion)
        case let .fourth(completion): fourth(completion: completion)
        case let .fifth(completion): fifth(completion: completion)
        case let .sixth(completion): sixth(completion: completion)
        case let .seventh(completion): seventh(completion: completion)
        case let .eighth(completion): eighth(completion: completion)
        case let .ninth(completion): ninth(completion: completion)
        case let .tenth(completion): tenth(completion: completion)
        case let .eleventh(completion): eleventh(completion: completion)
        case let .twelfth(completion): twelfth(completion: completion)
        case let .thirteenth(completion): thirteenth(completion: completion)
        case let .fourteenth(completion): fourteenth(completion: completion)
        case let .fifteenth(completion): fifteenth(completion: completion)
        }
    }
    private static func first(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func second(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func third(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func fourth(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func fifth(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func sixth(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func seventh(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func eighth(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func ninth(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func tenth(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func eleventh(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func twelfth(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func thirteenth(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func fourteenth(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
    private static func fifteenth(completion: @escaping CompletionBlock) {
        print(#function)
        SyncRequest(completion: completion).connect()
    }
}
