//
//  ViewController.swift
//  ar
//
//  Created by Wai Shan on 15/07/2020.
//  Copyright © 2020 Wai Shan. All rights reserved.
//

import UIKit

struct StringConstants {
    struct userDefaultKeys {
        static let anniversaryDate = "anniversaryDate"
    }
    struct dateFormats {
        static let defaultFormart = "dd ❤️ MM ❤️ yyyy"
    }
    struct locales {
        static let defaultLocale = "en_US_POSIX"
    }
    struct Defaults {
        static let emptyString = ""
    }
}

class Utilities: NSObject {
    static func stringFromDate(_ dateString: String, format: String = StringConstants.dateFormats.defaultFormart, locale: String = StringConstants.locales.defaultLocale) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = .current
        dateFormatter.locale = Locale(identifier: locale)
        return dateFormatter.date(from: dateString)
    }
    static func dateFromString(_ date: Date, format: String = StringConstants.dateFormats.defaultFormart, locale: String = StringConstants.locales.defaultLocale) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = .current
        dateFormatter.locale = Locale(identifier: locale)
        return dateFormatter.string(from: date)
    }
}

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
        let userSelectedDate = Utilities.dateFromString(anniversaryDatePicker.date)
        UserDefaults.standard.set(userSelectedDate, forKey: StringConstants.userDefaultKeys.anniversaryDate)
    }
    
    @IBAction func didChangedDateValue(_ sender: UIDatePicker) {
        let userSelectedDate = Utilities.dateFromString(sender.date)
        anniversaryDateLabel.text = userSelectedDate
    }
    
}
