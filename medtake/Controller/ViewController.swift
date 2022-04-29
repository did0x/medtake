//
//  ViewController.swift
//  medtake
//
//  Created by Ridho Saputra on 27/04/22.
//

import UIKit

import UIKit

class ViewController:  UITabBarController, UITabBarControllerDelegate {
    
    var homeViewController: HomeViewController!
    var calendarViewController: CalendarViewController!
    var noteViewController: NoteViewController!
//    var thirdViewController: ThirdViewController!
//    var fourthViewController: FourthViewController!

    override func viewDidLoad(){
        super.viewDidLoad()
        self.delegate = self
        
        homeViewController = HomeViewController()
        calendarViewController = CalendarViewController()
        noteViewController = NoteViewController()
//        thirdViewController = ThirdViewController()
//        fourthViewController = FourthViewController()
     
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        homeViewController.tabBarItem.selectedImage =
        UIImage(systemName: "house.fill")
        calendarViewController.tabBarItem.image = UIImage(systemName: "house")
        calendarViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        noteViewController.tabBarItem.image = UIImage(systemName: "house")
        noteViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
//        thirdViewController.tabBarItem.image = UIImage(named: "third")
//        thirdViewController.tabBarItem.selectedImage = UIImage(named: "third-selected")
//        fourthViewController.tabBarItem.image = UIImage(named: "fourth")
//        fourthViewController.tabBarItem.selectedImage = UIImage(named: "fourth-selected")
        viewControllers = [homeViewController, noteViewController, calendarViewController]
        for tabBarItem in tabBar.items! {
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
    }
    
    //MARK: UITabbar Delegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
      if viewController.isKind(of: NoteViewController.self) {
         let vc =  NoteViewController()
         vc.modalPresentationStyle = .overFullScreen
         self.present(vc, animated: true, completion: nil)
         return false
      }
      return true
    }
}
