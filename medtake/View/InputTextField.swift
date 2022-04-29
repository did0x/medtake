//
//  InputTextField.swift
//  medtake
//
//  Created by Ridho Saputra on 29/04/22.
//

import UIKit

class InputTextField: UIView {

    private let backgroundView = UIView()
    private let textField = UITextField()
    private let textLabel = UILabel()
    private var title = ""
    private var placeholder = ""
    
    init(title: String, placeholder: String) {
        super.init(frame: .zero)
        self.title = title
        self.placeholder = placeholder
        setupHierarchy()
        setupLayout()
        setupProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupHierarchy() {
        addSubviews(textLabel, backgroundView, textField)
    }
    
    private func setupLayout() {
        textLabel.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
        }
        
        backgroundView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(textLabel.snp.bottom).inset(-10)
            $0.height.equalTo(56)
        }
        
        textField.snp.makeConstraints {
            $0.leading.equalTo(backgroundView.snp.leading)
            $0.trailing.equalTo(backgroundView.snp.trailing)
            $0.bottom.equalTo(backgroundView.snp.bottom)
            $0.top.equalTo(backgroundView.snp.top)
        }
    }
    
    private func setupProperties() {
        backgroundView.backgroundColor = .white
        backgroundView.setupCornerRadius(12)
        
        textField.setLeftPadding(12)
        textField.setRightPadding(12)
        textField.placeholder = placeholder
        
        textLabel.configureWith(title, color: .black, alignment: .left, size: 14, weight: .semibold)
    }

}
