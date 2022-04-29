//
//  HomeViewController.swift
//  medtake
//
//  Created by Ridho Saputra on 27/04/22.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private let headerView = HeaderView()
    private let scheduleLabel = UILabel()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private let collectionFlowLayout = UICollectionViewFlowLayout.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .grayBackground
        setupHierarchy()
        setupLayout()
        setupProperties()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidLayoutSubviews() {
        setupCollectionView()
    }
    
    private func setupHierarchy() {
        view.addSubviews(headerView, scheduleLabel, collectionView)
    }
    
    private func setupLayout() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        scheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        scheduleLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 32).isActive = true
        scheduleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18).isActive = true
        scheduleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: scheduleLabel.bottomAnchor, constant: 4).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setupCollectionView() {
        collectionFlowLayout.itemSize = CGSize(width: view.bounds.width, height: 120)
//        collectionFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        collectionFlowLayout.minimumInteritemSpacing = 18
//        collectionFlowLayout.minimumLineSpacing = 18
        collectionFlowLayout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(collectionFlowLayout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "CardCell")
//        collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 24, right: 16)
        collectionView.alwaysBounceVertical = true
    }
    
    private func setupProperties() {
        scheduleLabel.configureWith("Jadwal Hari Ini", color: .black, alignment: .left, size: 16, weight: .bold)
    }
}

// MARK: - Handle Collection

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        return cell
    }
}
