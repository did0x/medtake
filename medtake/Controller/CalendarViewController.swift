//
//  CalendarViewController.swift
//  medtake
//
//  Created by Ridho Saputra on 29/04/22.
//

import UIKit

class CalendarViewController: UIViewController {
    
    private let weeklyCalendar = WeeklyCalendarView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .grayBackground
        view.addSubviews(weeklyCalendar)
        weeklyCalendar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
        // Do any additional setup after loading the view.
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
