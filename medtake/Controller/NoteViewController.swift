//
//  NoteViewController.swift
//  medtake
//
//  Created by Ridho Saputra on 29/04/22.
//

import UIKit

class NoteViewController: UIViewController {
    private let titleLabel = UILabel()
    private let nameTextField = InputTextField(title: "Nama", placeholder: "Nama Obat")
    private let benefitTextField = InputTextField(title: "Manfaat", placeholder: "Manfaat Obat")
    private let durationTextField = InputTextField(title: "Durasi", placeholder: "Durasi Obat")
    private let frequencyTextField = InputTextField(title: "Frekuensi", placeholder: "Frekuensi Obat")
    private let amountTextField = InputTextField(title: "Jumlah", placeholder: "Jumlah Obat")
    private let typeTextField = InputTextField(title: "Tipe", placeholder: "Tipe Obat")
    private let actionButton = ActionButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.largeContentTitle = "Catat Obat"
        view.backgroundColor = .grayBackground
        setupHierarchy()
        setupLayout()
        setupProperties()
        // Do any additional setup after loading the view.
    }
    
    private func setupHierarchy() {
        view.addSubviews(titleLabel, nameTextField, benefitTextField, durationTextField, frequencyTextField, amountTextField, typeTextField, actionButton)
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-32)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
        
        benefitTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).inset(-18)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
        
        durationTextField.snp.makeConstraints {
            $0.top.equalTo(benefitTextField.snp.bottom).inset(-18)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(18)
            $0.trailing.equalTo(frequencyTextField.snp.leading).inset(-16)
            $0.width.equalTo(frequencyTextField.snp.width)
        }
        
        frequencyTextField.snp.makeConstraints {
            $0.top.equalTo(benefitTextField.snp.bottom).inset(-18)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            $0.leading.equalTo(durationTextField.snp.trailing).inset(-16)
            $0.width.equalTo(durationTextField.snp.width)
        }
        
        amountTextField.snp.makeConstraints {
            $0.top.equalTo(durationTextField.snp.bottom).inset(-18)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(18)
            $0.trailing.equalTo(typeTextField.snp.leading).inset(-16)
            $0.width.equalTo(typeTextField.snp.width)
        }
        
        typeTextField.snp.makeConstraints {
            $0.top.equalTo(frequencyTextField.snp.bottom).inset(-18)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            $0.leading.equalTo(amountTextField.snp.trailing).inset(-16)
            $0.width.equalTo(amountTextField.snp.width)
        }
        
        actionButton.snp.makeConstraints {
            $0.bottom.left.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            $0.height.equalTo(56)
        }
    }
    
    private func setupProperties() {
        titleLabel.configureWith("Catat Obat", color: .black, alignment: .left, size: 32, weight: .bold)
        actionButton.setTitle("Catat", for: .normal)
        actionButton.isEnabled = true
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
