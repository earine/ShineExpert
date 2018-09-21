//
//  ProfileViewController.swift
//  ShineExpert
//
//  Created by Marina Lunts on 20.09.2018.
//  Copyright © 2018 Marina Lunts. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var totalDaysLabel: UILabel!
    @IBOutlet weak var todaysCarsLabel: UILabel!
    @IBOutlet weak var todaysIncomeLabel: UILabel!
    @IBOutlet weak var totalCarsLabel: UILabel!
    @IBOutlet weak var totalIncomeLabel: UILabel!
    
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu()
        profilePic(imageView: profilePic)
        loadProfileInfo()
    }
    

    func sideMenu() {
        if revealViewController != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController()?.rearViewRevealWidth = 250
        view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        }
    }

    private func profilePic(imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.layer.masksToBounds = true
       // imageView.image = imageToSet
        imageView.clipsToBounds = true
    }
    
    private func loadProfileInfo() {
        nameLabel.text = "\(user?.firstName ?? "Никита")"
        ratingLabel.text = "\(user?.rating ?? 4.85)"
        totalDaysLabel.halfTextColorChange(fullText: "\(user?.totalDays ?? 20) дней в Shine Expert".uppercased(), changeText: "SHINE EXPERT")
        todaysCarsLabel.halfTextColorChange(fullText: "Машин помыто: \(user?.todaysWashedCars ?? 2)", changeText: "\(user?.todaysWashedCars ?? 2)")
        todaysIncomeLabel.halfTextColorChange(fullText: "Заработано: \(user?.todaysIncome ?? 234) грн", changeText: "\(user?.todaysIncome ?? 234) грн")
        totalCarsLabel.halfTextColorChange(fullText: "Машин помыто: \(user?.totalDays ?? 14)", changeText: "\(user?.totalDays ?? 14)")
        totalIncomeLabel.halfTextColorChange(fullText: "Заработано: \(user?.totalIncome ?? 1643) грн", changeText: "\(user?.totalIncome ?? 1643) грн")


    }
}
