//
//  WeeklyCollectionViewCell.swift
//  medtake
//
//  Created by Ridho Saputra on 29/04/22.
//

import UIKit

class WeeklyCollectionViewCell: UICollectionViewCell {
    let dayLabel = UILabel()
    
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
        contentView.addSubview(dayLabel)
    }
    
    private func setupLayout() {
        dayLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    private func setupProperties() {
        
    }
}
