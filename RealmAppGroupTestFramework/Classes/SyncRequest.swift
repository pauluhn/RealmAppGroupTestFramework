//
//  SyncRequest.swift
//  Pods
//
//  Created by Paul Uhn on 3/27/17.
//
//

import Foundation
import Alamofire

typealias ParseBlock = (Result<Any>) -> Void

struct SyncRequest {
    let parseBlock: ParseBlock
    private static let queue = DispatchQueue(label: "sync request queue", qos: .userInitiated)
    init(completion: CompletionBlock?) {
        parseBlock = { result in
            switch result {
            case .failure(let e):
                completion?()
            case .success(let v):
                let models = SyncBuilder.build(v)
                SyncTransaction(models: models, completion: completion).perform()
            }
        }
    }
    func connect() {
        print(#function)
        Alamofire
            .request("http://jsonstub.com/your/first/request",
                     headers: ["Content-Type": "application/json",
                               "JsonStub-User-Key": "9ce9f3a4-b708-4f3f-865f-e7d85c913aed",
                               "JsonStub-Project-Key": "f19e0a0a-3959-4281-92c0-e04f83e1389a"])
            .validate()
            .responseJSON(queue: SyncRequest.queue) { response in self.parseBlock(response.result) }
    }
}
