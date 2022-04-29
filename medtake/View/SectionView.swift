//
//  SectionView.swift
//  medtake
//
//  Created by Ridho Saputra on 29/04/22.
//

import UIKit

class SectionView: UIView {

    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        setupHierarchy()
        setupLayout()
        setupProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubviews(titleLabel, valueLabel)
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().inset(12)
        }
        
        valueLabel.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(12)
            $0.top.equalTo(titleLabel.snp.bottom).inset(-20)
        }
    }
    
    private func setupProperties() {
        containerView.backgroundColor = .white
        containerView.setupCornerRadius(12)
        
        
        
    }
    
    func setTitle(title: String) {
        titleLabel.configureWith(title, color: .gray, alignment: .left, size: 12, weight: .semibold)
    }
    
    func setValue(value: String) {
        valueLabel.configureWith(value, color: .black, alignment: .left, size: 12, weight: .bold)
    }
    
}
