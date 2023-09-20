//
//  ViewController.swift
//  StudyWeek10
//
//  Created by 박다혜 on 2023/09/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        NetworkBasic.shared.random { photo, error in
//            guard let photo = photo else { return }  -> 이런식으로 쓰면 생기는 문제 
//        }

        Network.shared.request(type: Photo.self, api: .search(query: "apple")) { response in
            <#code#>
        }

        Network.shared.request(type: PhotoResult.self, api: .photo(id: "lbmrrNgq2lo")) { response in
            switch response {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                print(failure.errorDescription)
            }
        }
    }
//lbmrrNgq2lo

}

// Codable = Decodable + Encodable

struct Photo: Decodable {
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]
}

struct PhotoResult: Decodable {
    let id: String
    let created_at:String
    let urls: PhotoURL
}

struct PhotoURL: Decodable {
    let full: String
    let thumb: String
}
