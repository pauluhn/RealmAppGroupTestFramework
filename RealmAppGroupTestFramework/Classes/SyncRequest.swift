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
        SyncRequest.queue.asyncAfter(deadline: .now() + 1) { 
            self.parseBlock(Result.success(Stubber.default.data()))
        }
//        Alamofire
//            .request("http://jsonstub.com/your/first/request",
//                     headers: ["Content-Type": "application/json",
//                               "JsonStub-User-Key": "9ce9f3a4-b708-4f3f-865f-e7d85c913aed",
//                               "JsonStub-Project-Key": "f19e0a0a-3959-4281-92c0-e04f83e1389a"])
//            .validate()
//            .responseJSON(queue: SyncRequest.queue) { response in self.parseBlock(response.result) }
    }
}

private class Stubber {
    static let `default` = Stubber()
    private init() {}
    func data() -> Any {
        guard let mypath = path(),
            let url = Bundle(path: mypath)?.url(forResource: "GetGroupMemberList", withExtension: "json") else { return [:] }
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            return json
        } catch {
            print("error is \(error.localizedDescription)")
        }
        return [:]
    }
    private func path() -> String? {
        guard let enumerator = FileManager.default.enumerator(atPath: Bundle.main.bundlePath) else { return nil }
        for item in enumerator.allObjects.map({ String(describing: $0) }) {
            guard let filepath = item as? NSString else { continue }
            if filepath.lastPathComponent == "RealmAppGroupTestFramework.bundle" {
                let bundlePath = Bundle.main.bundlePath as? NSString
                return bundlePath?.appendingPathComponent(filepath as String)
            }
        }
        return nil
    }
}
