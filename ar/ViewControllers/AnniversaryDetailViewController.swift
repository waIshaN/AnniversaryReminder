//
//  AnniversaryDetailViewController.swift
//  ar
//
//  Created by Wai Shan on 15/07/2020.
//  Copyright © 2020 Wai Shan. All rights reserved.
//

import UIKit

class AnniversaryDetailViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var anniversaryDetailLabel: UILabel!
    
    let anniversaryDate: Date = Utilities.stringFromDate(UserDefaults.standard.string(forKey: StringConstants.userDefaultKeys.anniversaryDate) ?? StringConstants.Defaults.emptyString) ?? Date()
    var currentDate: Date = Date()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeAnnivesaryShowingFormat()
        navigationSetup()
    }
    
    func navigationSetup() {
        let changeBtn = UIBarButtonItem(title: StringConstants.buttonNames.change, style: .done, target: self, action: #selector(tappedOnChangedBarBtn))
        navigationItem.rightBarButtonItem = changeBtn
    }
    
    func changeAnnivesaryShowingFormat(_ index: Int = 0) {
        segmentedControl.selectedSegmentIndex == 0 ? dayCounter() : dateCounter()
    }
    
    func dayCounter() {
        currentDate = Date()
        let dateComponent = DateComponentsFormatter()
        dateComponent.unitsStyle = .full
        dateComponent.allowedUnits = [.day]
        let dayResult = dateComponent.string(from: anniversaryDate, to: currentDate) ?? StringConstants.Defaults.emptyString
        anniversaryDetailLabel.text = dayResult
    }
    
    func dateCounter() {
        timer.invalidate()
        let dateComponent = DateComponentsFormatter()
        dateComponent.unitsStyle = .full
        dateComponent.allowedUnits = [.year, .month, .day]
        let dateResult = dateComponent.string(from: anniversaryDate, to: currentDate) ?? StringConstants.Defaults.emptyString
        let charChangedResult = dateResult.replacingOccurrences(of: StringConstants.Defaults.comma, with: StringConstants.Defaults.heart, options: .literal, range: nil)
        anniversaryDetailLabel.text = charChangedResult
    }
    
    @IBAction func didChangedSegmentedValue(_ sender: UISegmentedControl) {
        changeAnnivesaryShowingFormat(sender.selectedSegmentIndex)
    }
    
    @objc func tappedOnChangedBarBtn(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: StringConstants.storyboardNames.main, bundle: nil)
        let selectAnniVC = storyBoard.instantiateViewController(withIdentifier: StringConstants.storyboardIdentifiers.selectAnniViewController)
        self.navigationController?.pushViewController(selectAnniVC, animated: true)
    }
    
}
