//
//  CatResponse.swift
//  Cat-tableview
//
//  Created by phamtu on 15/07/2021.
//

import Realm
import RealmSwift

//// MARK: - CatResponse
//struct CatResponse: Codable {
//    let id: Int?
//    let url: String?
//    let webpurl: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id,url,webpurl
//    }
//}

// MARK: - Item
@objcMembers class CatResponse: Object {
    dynamic var id: Int?
    dynamic var url: String?
    dynamic var webpurl: String?
    dynamic var incompleteResults: Bool = true
    
    // Custom key
    dynamic var keyword: String = "id"
    
    override static func primaryKey() -> String? {
        return "keyword"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // init value object
        id = try container.decode(Int.self, forKey: .id)
        url = try? container.decode(String.self, forKey: .url)
        webpurl = try? container.decode(String.self, forKey: .webpurl)
        // init realm
        super.init()
    }
    required override init() {
        super.init()
    }
}
extension CatResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case id, url , webpurl
    }
}
