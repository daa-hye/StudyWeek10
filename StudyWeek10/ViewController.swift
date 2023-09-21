//
//  ViewController.swift
//  StudyWeek10
//
//  Created by 박다혜 on 2023/09/19.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {

    private lazy var scrollView = {
        let view = UIScrollView()
        view.minimumZoomScale = 1
        view.maximumZoomScale = 4
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .green
        view.delegate = self
        return view
    }()

    private let imageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        return view
    }()

    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureGesture()

        viewModel.request { url in
            self.imageView.kf.setImage(with: url)
        }


//        NetworkBasic.shared.random { photo, error in
//            guard let photo = photo else { return }  -> 이런식으로 쓰면 생기는 문제 
//        }

//        Network.shared.request(type: PhotoResult.self, api: .photo(id: "lbmrrNgq2lo")) { response in
//            switch response {
//            case .success(let success):
//                dump(success)
//            case .failure(let failure):
//                print(failure.errorDescription)
//            }
//        }
    }

    private func configureGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture))
        tap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tap)
    }

    @objc func doubleTapGesture() {
        if scrollView.zoomScale == 1 {
            scrollView.setZoomScale(2, animated: true)
        } else {
            scrollView.setZoomScale(1, animated: true)
        }
    }

    private func configureLayout() {
        scrollView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.center.equalTo(view)
        }

        imageView.snp.makeConstraints { make in
            make.size.equalTo(scrollView)
        }
    }

    private func configureHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }

//lbmrrNgq2lo

}

extension ViewController: UIScrollViewDelegate {

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

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
