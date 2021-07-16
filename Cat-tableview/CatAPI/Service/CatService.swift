//
//  CatService.swift
//  Cat-tableview
//
//  Created by phamtu on 15/07/2021.
//

import Foundation
import QNetwork

class CatService: QBaseService {
    func searchRepositories( items: Int, completion: @escaping (Result<CatResponse, BaseError>) -> Void) {
        provider.request(MultiTarget(CatAPI.searchRepositories( items : items)), type: CatResponse.self) { result in
            completion(result)
        }
    }
}
