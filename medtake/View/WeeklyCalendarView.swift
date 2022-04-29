//
//  WeeklyCalendarView.swift
//  medtake
//
//  Created by Ridho Saputra on 29/04/22.
//

import UIKit

class WeeklyCalendarView: UIView {
    
    private let containerView = UIView()
    private let dayStackView = UIStackView()
    private let mondayLabel = UILabel()
    private let tuesdayLabel = UILabel()
    private let wednesdayLabel = UILabel()
    private let thursdayLabel = UILabel()
    private let fridayLabel = UILabel()
    private let saturdayLabel = UILabel()
    private let sundayLabel = UILabel()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private let collectionFlowLayout = UICollectionViewFlowLayout.init()
    
    private var totalDate = [Date]()
    private var selectedDate = Date()
    
    init() {
        super.init(frame: .zero)
    
        setupHierarchy()
        setupLayout()
        setupCollectionView()
        setupProperties()
        setWeek()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setWeek() {
        totalDate.removeAll()
        
        var current = CalendarHelper().sundayForDate(date: selectedDate)
        let nextSunday = CalendarHelper().addDays(date: current, days: 7)
        
        while (current < nextSunday)
        {
            totalDate.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
        
        collectionView.reloadData()
    }

    private func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubviews(dayStackView, collectionView)
        dayStackView.addArrangedSubviews([sundayLabel, mondayLabel, tuesdayLabel, wednesdayLabel, thursdayLabel, fridayLabel, saturdayLabel])
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.width.height.equalTo(108)
        }
        
        dayStackView.snp.makeConstraints {
            $0.centerX.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(dayStackView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupCollectionView() {
        collectionFlowLayout.itemSize = CGSize(width: 290 / 8, height: 32)
        collectionView.setCollectionViewLayout(collectionFlowLayout, animated: true)
//        collectionFlowLayout.scrollDirection = .horizontal

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WeeklyCollectionViewCell.self, forCellWithReuseIdentifier: "WeeklyCell")
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    private func setupProperties() {
        containerView.backgroundColor = .white
        containerView.setupCornerRadius(12)
        
//        dayStackView.backgroundColor = .white
        dayStackView.axis = .horizontal
        dayStackView.distribution = .fillEqually
        
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
//        leftSwipe.direction = .left
//        containerView.addGestureRecognizer(leftSwipe)
//        collectionView.backgroundColor = .gray
        
        sundayLabel.configureWith("S", color: .gray, alignment: .center, size: 12)
        mondayLabel.configureWith("M", color: .gray, alignment: .center, size: 12)
        tuesdayLabel.configureWith("T", color: .gray, alignment: .center, size: 12)
        wednesdayLabel.configureWith("W", color: .gray, alignment: .center, size: 12)
        thursdayLabel.configureWith("T", color: .gray, alignment: .center, size: 12)
        fridayLabel.configureWith("F", color: .gray, alignment: .center, size: 12)
        saturdayLabel.configureWith("S", color: .gray, alignment: .center, size: 12)
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
            
        if (sender.direction == .left) {
            print("Swipe Left")
        }
            
        if (sender.direction == .right) {
            print("Swipe Right")
        }
    }
}

// MARK: - Handle Collection

extension WeeklyCalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeeklyCell", for: indexPath) as! WeeklyCollectionViewCell
        let date = totalDate[indexPath.item]
        cell.dayLabel.text = String(CalendarHelper().dayOfMonth(date: date))
        cell.dayLabel.textColor = date == selectedDate ? .white : .black
        cell.backgroundColor = date == selectedDate ? .primary : .clear
        cell.setupCornerRadius(8)
//        cell.backgroundColor = .primary
        return cell
    }
}
