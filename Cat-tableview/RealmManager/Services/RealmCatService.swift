//
//  RealmCatService.swift
//  Cat-tableview
//
//  Created by phamtu on 22/07/2021.
//

import Foundation

protocol RealmCatServiceProtocol {
    func saveRepositoryResponse(with keyword: String, repoList: CatResponse) -> Bool
    func getRepositoryResponse(with keyword: String) -> CatResponse?
    func deleteRepositoryResponse(with keyword: String) -> Bool
    func deleteAllRepositoryResponses() -> Bool
}

class RealmCatService: RealmManager<CatResponse>, RealmCatServiceProtocol {
    /// Save repository response
    /// - Parameter repoList: repoList need save
    /// - Returns: success or failed
    func saveRepositoryResponse(with keyword: String, repoList: CatResponse) -> Bool {
        repoList.keyword = keyword
        return self.save(entity: repoList)
    }

    /// get repository response saved
    /// - Parameter keyword: keyword search
    /// - Returns: success or failed
    func getRepositoryResponse(with keyword: String) -> CatResponse? {
        let repositoryResponse = self.queryAll().filter({ $0.keyword == keyword}).first
        return repositoryResponse
    }

    /// Delete repository respnse
    /// - Parameter keyword: keyword search
    /// - Returns: success or failed
    func deleteRepositoryResponse(with keyword: String) -> Bool {
        if let repositoryResponse = self.getRepositoryResponse(with: keyword) {
            return self.delete(entity: repositoryResponse)
        }
        return false
    }

    /// Delete all repository response
    /// - Returns: success or failed
    func deleteAllRepositoryResponses() -> Bool {
        return self.deleteAll()
    }

    // Make singleton class
    private override init() {}

    static let shared = RealmCatService()
}
extension CatResponse: RealmRepresentable {
    var uid: String {
        return keyword
    }
}
