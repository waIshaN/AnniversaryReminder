//
//  Utilities.swift
//  ar
//
//  Created by Wai Shan on 15/07/2020.
//  Copyright © 2020 Wai Shan. All rights reserved.
//

import Foundation

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
