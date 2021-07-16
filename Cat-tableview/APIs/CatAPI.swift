//
//  CatAPI.swift
//  Cat-tableview
//
//  Created by phamtu on 15/07/2021.
//

import Foundation
import Moya
import QNetwork

enum CatAPI {
    case searchRepositories( items: Int )
}

extension CatAPI: TargetType {
//            let url = URL(string: Configs.Network.baseUrl)!
    //        return url
    var baseURL: URL {
        let url = URL(string: "https://thatcopy.pw/")!
        return url
    }
    
    var path: String {
        switch self {
        case .searchRepositories:
            return "catapi/rest/"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        var dataUrl: URL?
        
        //        switch self {
        //        case .searchRepositories:
        //            if let file = Bundle.main.url(forResource: "SearchRepositoriesResponse", withExtension: "json") {
        //                dataUrl = file
        //            }
        //        }
        if let url = dataUrl, let data = try? Data(contentsOf: url) {
            return data
        }
        
        return Data()
    }
    
    var task: Task {
        switch self {
        case .searchRepositories:
            if let parameters = parameters {
                return .requestParameters(parameters: parameters, encoding: parameterEncoding)
            }
        }
        return .requestPlain
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var parameters: [String: Any]? {
        var params: [String: Any] = [:]
        
        switch self {
        case .searchRepositories( let page):
            params["page"] = page
            
        }
        
        return params
    }
    
    // For json encode. Use in post request
    var jsonEncoding: JSONEncoding {
        return JSONEncoding.default
    }
    
    // For param encode. Use in get request
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
}
