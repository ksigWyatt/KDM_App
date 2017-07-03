//
//  Formatter.swift
//  KDM App
//
//  Created by Wyatt Baggett on 7/2/17.
//  Copyright © 2017 Kingdom Digital Media. All rights reserved.
//

import Foundation

extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: -14400)
        formatter.dateFormat = "yyyy-MM-dd_HH:mm:ss.SSS"
        return formatter
    }()
}
extension Date {
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
}

extension String {
    var dateFromISO8601: Date? {
        return Formatter.iso8601.date(from: self)   // returns ex: "Mar 22, 2017, 10:22 AM"
    }
}
