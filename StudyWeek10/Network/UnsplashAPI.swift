//
//  UnsplashAPI.swift
//  StudyWeek10
//
//  Created by 박다혜 on 2023/09/19.
//

import Foundation
import Alamofire

//enum Router: URLRequestConvertible {
//    func asURLRequest() throws -> URLRequest {
//        <#code#>
//    }
//}

enum UnsplashAPI {

    private static let key = "Fn9kq9LPyt9eaoqJi1QhHPh4F273dPGZ4Fb38-xPDHo"

    case search(query: String)
    case random
    case photo(id: String)  //연관값

    private var baseURL: String {
        return "https://api.unsplash.com/"
    }

    var endpoint: URL {
        switch self {
        case .search:
            return URL(string: baseURL + "search/photos")!
        case .random:
            return URL(string: baseURL + "photos/random")!
        case .photo(let id):
            return URL(string: baseURL + "photos/\(id)")!
        }
    }

    var header: HTTPHeaders {
        return ["Authorization": "Client-ID \(UnsplashAPI.key)"]
    }

    var method: HTTPMethod {
        return .get
    }

    var query: [String: String] {
        switch self {
        case .search(let query):
            return ["query": query]
        case .random, .photo:
            return ["": ""]
        }
    }

}
