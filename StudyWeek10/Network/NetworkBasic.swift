//
//  NetworkBasic.swift
//  StudyWeek10
//
//  Created by 박다혜 on 2023/09/19.
//

import Foundation
import Alamofire

enum UnsplashError: Int, Error, LocalizedError {

    case unauthorized = 401
    case permissionDenied = 403
    case invalidServer = 500
    case missingParameter = 400

    var errorDescription: String {
        switch self {
        case .unauthorized:
            return "인증 정보가 없습니다"
        case .permissionDenied:
            return "권한이 없습니다"
        case .invalidServer:
            return "서버 점검 중입니다"
        case .missingParameter:
            return "검색어를 입력해주세요"
        }
    }
}

final class NetworkBasic {

    static let shared = NetworkBasic()

    private init() { }

    func request(api: UnsplashAPI, query: String, completion: @escaping (Result<Photo, UnsplashError>) -> Void) {

        AF.request(api.endpoint, method: api.method, parameters: api.query,
                   encoding: URLEncoding(destination: .queryString), headers: api.header)
        .responseDecodable(of: Photo.self) { response in
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

    func random(api: UnsplashAPI, completion: @escaping (Result<PhotoResult, UnsplashError>) -> Void) {

        AF.request(api.endpoint, method: api.method, headers: api.header)
            .responseDecodable(of: PhotoResult.self) { response in
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

    func detailPhoto(api: UnsplashAPI, id: String, completion: @escaping (Result<PhotoResult, UnsplashError>) -> Void) {

        AF.request(api.endpoint, method: api.method, headers: api.header)
            .responseDecodable(of: PhotoResult.self) { response in
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
