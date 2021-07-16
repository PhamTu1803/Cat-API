//
//  CatResponse.swift
//  Cat-tableview
//
//  Created by phamtu on 15/07/2021.
//

import Foundation

// MARK: - CatResponse
struct CatResponse: Codable {
    let id: Int?
    let url: String?
    let webpurl: String?

    enum CodingKeys: String, CodingKey {
        case id  , url , webpurl
       
    }
}
