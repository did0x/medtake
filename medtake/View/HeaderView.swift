//
//  HeaderView.swift
//  medtake
//
//  Created by Ridho Saputra on 27/04/22.
//

import UIKit

class HeaderView: UIView {
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()

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
        self.addSubviews(titleLabel, subtitleLabel)
    }
    
    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16).isActive = true
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
    }
    
    private func setupProperties() {
        self.setupCornerRadius(12)
        self.backgroundColor = .primary
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.configureWith("Hope You Get Well Soon", color: .white, alignment: .left, size: 32, weight: .bold)
        subtitleLabel.configureWith("Let’s see the next medicine!", color: .white, alignment: .left, size: 14, weight: .medium)
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
