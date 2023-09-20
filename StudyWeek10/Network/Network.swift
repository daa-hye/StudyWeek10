//
//  Network.swift
//  StudyWeek10
//
//  Created by 박다혜 on 2023/09/19.
//

import Foundation
import Alamofire

class Network {

    static let shared = Network()

    private init() { }

    // "abc" > String > String.Type

    func request<T: Decodable>(type: T.Type, api: UnsplashAPI, completion: @escaping (Result<T, UnsplashError>) -> Void) {

        AF.request(api.endpoint, method: api.method, parameters: api.query,
                   encoding: URLEncoding(destination: .queryString), headers: api.header)
        .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case.failure(_):
                    let statusCode = response.response?.statusCode ?? UnsplashError.invalidServer.rawValue
                    guard let error = UnsplashError(rawValue: statusCode) else { return }
                    completion(.failure(error))
                }
        }
    }
}
