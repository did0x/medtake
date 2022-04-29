//
//  CardCollectionViewCell.swift
//  medtake
//
//  Created by Ridho Saputra on 27/04/22.
//

import UIKit
import SnapKit

class CardCollectionViewCell: UICollectionViewCell {
    private let containerView = UIStackView()
    private let bodyView = UIView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let timeLabel = UILabel()
    private let checkButton = UIButton()
    
    private let doneView = UIView()
    private let messageLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        setupProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setupHierarchy() {
        self.addSubview(containerView)
        containerView.addArrangedSubviews([titleLabel, timeLabel])
//        bodyView.addSubviews(imageView, titleLabel, timeLabel, checkButton)
//        doneView.addSubview(messageLabel)
    }
    
    
    private func setupLayout() {
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview().inset(16)
        }
        
        containerView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
//
//        bodyView.snp.makeConstraints {
//            $0.leading.trailing.top.equalToSuperview().inset(16)
//        }
//
//        imageView.snp.makeConstraints {
//            $0.top.leading.bottom.equalToSuperview().inset(16)
//            $0.width.height.equalTo(48)
//        }
//
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
        }

        timeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(4)
            $0.leading.equalToSuperview().inset(16)
        }
//
//        doneView.snp.makeConstraints {
//            $0.bottom.leading.trailing.equalToSuperview().inset(16)
//            $0.height.equalTo(48)
//        }
//
//        messageLabel.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview().inset(28)
//            $0.top.bottom.equalToSuperview().inset(16)
//        }
    }
    
    private func setupProperties() {
        containerView.axis = .vertical
        containerView.distribution = .fillEqually
        containerView.isLayoutMarginsRelativeArrangement = true
        containerView.setCustomSpacing(14, after: titleLabel)
//        containerView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        containerView.backgroundColor = .white
        containerView.setupCornerRadius(12)
        
        bodyView.backgroundColor = .gray
        bodyView.setupCornerRadius(12)

//        doneView.isHidden = true
        doneView.backgroundColor = .primary
        doneView.setupCornerRadius(12)
        
        imageView.backgroundColor = .primary
        imageView.setupCornerRadius(8)
        
        titleLabel.configureWith("Nama Obat", color: .black, alignment: .left, size: 14, weight: .bold)
        timeLabel.configureWith("Waktu Minum Obat", color: .black, alignment: .left, size: 12)
        messageLabel.configureWith("Sudah diminum pukul 09:58", color: .white, alignment: .center, size: 14, weight: .bold)
    }
}
