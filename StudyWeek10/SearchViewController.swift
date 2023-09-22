//
//  SearchViewController.swift
//  StudyWeek10
//
//  Created by 박다혜 on 2023/09/21.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {

    let list = Array(1...100)
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionView())

    var dataSource: UICollectionViewDiffableDataSource<Int, Int>!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureDataSource()
    }

    func configureHierarchy() {
        view.addSubview(collectionView)
    }

    func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }


    func configureCollectionView() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .vertical
        return layout
    }

    func configureDataSource() {

        let cellRegistration = UICollectionView.CellRegistration<SearchCollectionViewCell, Int> { cell, indexPath, itemIdentifier in
            cell.imageView.image = UIImage(systemName: "star")
            cell.label.text = "\(itemIdentifier)번"
        }

        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in

            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })

        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        snapshot.appendSections([0])
        snapshot.appendItems(list)
        dataSource.apply(snapshot)

    }

}

//class SearchViewController: UIViewController {
//
//    let scrollView = UIScrollView()
//    let contentView = UIView()
//
//    let imageView = UIImageView()
//    let label = UILabel()
//    let button = UIButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        configureHierarchy()
//        configureLayout()
//        configureContentView()
//    }
//
//    func configureContentView() {
//        contentView.addSubview(imageView)
//        contentView.addSubview(button)
//        contentView.addSubview(label)
//
//        imageView.backgroundColor = .red
//        button.backgroundColor = .blue
//        label.backgroundColor = .darkGray
//
//        imageView.snp.makeConstraints { make in
//            make.top.horizontalEdges.equalTo(contentView).inset(10)
//            make.height.equalTo(200)
//        }
//
//        button.snp.makeConstraints { make in
//            make.bottom.horizontalEdges.equalTo(contentView).inset(10)
//            make.height.equalTo(80)
//        }
//
//        label.text = "asdfasfdsfsfasfafsafasdfasfdsfsfasfafsafasdfasfdsfsfasfafsafasdfasfdsfsfasfafsafasdfasfdsfsfasfafsafasdfasfdsfsfasfafsafasdfasfdsfsfasfafsaf"
//        label.numberOfLines = 0
//        label.textColor = .white
//
//        label.snp.makeConstraints { make in
//            make.horizontalEdges.equalTo(contentView)
//            make.top.equalTo(imageView.snp.bottom).offset(50)
//            make.bottom.equalTo(button.snp.top).offset(-50)
//        }
//    }
//
//    func configureHierarchy() {
//        view.addSubview(scrollView)
//        scrollView.addSubview(contentView)
//    }
//
//    func configureLayout() {
//        scrollView.bounces = false
//        scrollView.backgroundColor = .white
//        scrollView.snp.makeConstraints { make in            // update , remake 살펴보기
//            make.edges.equalTo(view.safeAreaLayoutGuide)
//        }
//
//        contentView.backgroundColor = .lightGray
//        contentView.snp.makeConstraints { make in
//            make.verticalEdges.equalTo(scrollView)
//            make.width.equalTo(scrollView.snp.width)
//        }
//    }
//
//}

//class SearchViewController: UIViewController {
//
//    let scrollView = UIScrollView()
//    let stackView = UIStackView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        configureHierarchy()
//        configureLayout()
//        configureStackview()
//    }
//
//    func configureHierarchy() {
//        view.addSubview(scrollView)
//        scrollView.addSubview(stackView)
//    }
//
//    func configureLayout() {
//        scrollView.backgroundColor = .lightGray
//        scrollView.snp.makeConstraints { make in
//            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
//            make.height.equalTo(70)
//        }
//
//        stackView.backgroundColor = .black
//        stackView.spacing = 8
//        stackView.snp.makeConstraints { make in
//            make.edges.equalTo(scrollView)
//            make.height.equalTo(70)
//        }
//    }
//
//    func configureStackview() {
//        let label1 = UILabel()
//        label1.text = "안녕하세요"
//        label1.backgroundColor = .cyan
//        label1.textColor = .white
//        stackView.addArrangedSubview(label1)
//        let label2 = UILabel()
//        label2.text = "qwerqwerqwer"
//        label2.backgroundColor = .cyan
//        label2.textColor = .white
//        stackView.addArrangedSubview(label2)
//        let label3 = UILabel()
//        label3.text = "wasdwasdwasd"
//        label3.textColor = .white
//        stackView.addArrangedSubview(label3)
//        let label4 = UILabel()
//        label4.text = "123412341234"
//        label4.textColor = .white
//        stackView.addArrangedSubview(label4)
//        let label5 = UILabel()
//        label5.text = "09870987"
//        label5.textColor = .white
//        stackView.addArrangedSubview(label5)
//    }
//}
