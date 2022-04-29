//
//  DetailViewController.swift
//  medtake
//
//  Created by Ridho Saputra on 29/04/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let benefitLabel = UILabel()
    private let durationSection = SectionView()
    private let frequencySection = SectionView()
    private let amountSection = SectionView()
    private let typeSection = SectionView()
    private let nextCheckLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .grayBackground
        setupHierarchy()
        setupLayout()
        setupProperties()
        // Do any additional setup after loading the view.
    }
    
    private func setupHierarchy() {
        view.addSubviews(imageView, nameLabel, benefitLabel, durationSection, frequencySection, amountSection, typeSection, nextCheckLabel)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints {
            $0.centerX.top.equalTo(view.safeAreaLayoutGuide).inset(18)
            $0.width.height.equalTo(98)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(imageView.snp.bottom).inset(-24)
        }
        
        benefitLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(nameLabel.snp.bottom).inset(-8)
        }
        
        durationSection.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(18)
            $0.top.equalTo(benefitLabel.snp.bottom).inset(-32)
            $0.trailing.equalTo(frequencySection.snp.leading).inset(-18)
            $0.width.equalTo(frequencySection.snp.width)

        }
        
        frequencySection.snp.makeConstraints {
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            $0.top.equalTo(benefitLabel.snp.bottom).inset(-32)
            $0.leading.equalTo(durationSection.snp.trailing).inset(-18)
            $0.width.equalTo(durationSection.snp.width)
        }
        
        
        amountSection.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(18)
            $0.top.equalTo(durationSection.snp.bottom).inset(-18)
            $0.trailing.equalTo(typeSection.snp.leading).inset(-18)
            $0.width.equalTo(typeSection.snp.width)

        }
        
        typeSection.snp.makeConstraints {
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            $0.top.equalTo(frequencySection.snp.bottom).inset(-18)
            $0.leading.equalTo(amountSection.snp.trailing).inset(-18)
            $0.width.equalTo(amountSection.snp.width)
        }
        
        nextCheckLabel.snp.makeConstraints {
            $0.top.equalTo(amountSection.snp.bottom).inset(-32)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
    }
    
    private func setupProperties() {
        imageView.backgroundColor = .primary
        imageView.setupCornerRadius(12)
        
        nameLabel.configureWith("Bandrex", color: .black, alignment: .center, size: 24, weight: .bold)
        benefitLabel.configureWith("Obat untuk melangsingkan badan", color: .black, alignment: .center, size: 12, weight: .medium)
        
        durationSection.setTitle(title: "Duration")
        durationSection.setValue(value: "30 Hari")
        
        frequencySection.setTitle(title: "Frequency")
        frequencySection.setValue(value: "3x Sehari")
        
        amountSection.setTitle(title: "Duration")
        amountSection.setValue(value: "30 Hari")
        
        typeSection.setTitle(title: "Frequency")
        typeSection.setValue(value: "3x Sehari")
        
        nextCheckLabel.configureWith("Ceklis Selanjutnya", color: .black, alignment: .left, size: 16, weight: .bold)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
