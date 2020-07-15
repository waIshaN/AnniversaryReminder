//
//  ViewController.swift
//  ar
//
//  Created by Wai Shan on 15/07/2020.
//  Copyright © 2020 Wai Shan. All rights reserved.
//

import UIKit

class SelectAnniversaryViewController: UIViewController {
    
    @IBOutlet weak var anniversaryDatePicker: UIDatePicker!
    @IBOutlet weak var anniversaryDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        navigationSetup()
    }
    
    func navigationSetup() {
        let saveBtn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(tappedOnSaveBtn))
        navigationItem.rightBarButtonItem = saveBtn
    }
    
    func setup() {
        anniversaryDatePicker.datePickerMode = .date
        guard let anniversaryDate = Utilities.stringFromDate(UserDefaults.standard.string(forKey: StringConstants.userDefaultKeys.anniversaryDate) ?? StringConstants.Defaults.emptyString) else {
            anniversaryDateLabel.text = Utilities.dateFromString(Date())
            return
        }
        anniversaryDatePicker.date = anniversaryDate
        anniversaryDateLabel.text = Utilities.dateFromString(anniversaryDate)
    }

}

// Mark: Actions
extension SelectAnniversaryViewController {
    
    @objc func tappedOnSaveBtn(_ sender: UIBarButtonItem) {
        let userSelectedDateString = Utilities.dateFromString(anniversaryDatePicker.date)
        UserDefaults.standard.set(userSelectedDateString, forKey: StringConstants.userDefaultKeys.anniversaryDate)
        let storyBoard = UIStoryboard(name: StringConstants.storyboardNames.main, bundle: nil)
        let anniDetailsVC = storyBoard.instantiateViewController(withIdentifier: StringConstants.storyboardIdentifiers.anniDetailsNavigation)
        anniDetailsVC.modalPresentationStyle = .fullScreen
        self.present(anniDetailsVC, animated: true)
    }
    
    @IBAction func didChangedDateValue(_ sender: UIDatePicker) {
        let userSelectedDate = Utilities.dateFromString(sender.date)
        anniversaryDateLabel.text = userSelectedDate
    }
    
}
