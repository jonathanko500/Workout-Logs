//
//  Log.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 11/28/23.
//

//
// Created for UICalendarView_SwiftUI
// by Stewart Lynch on 2022-06-28
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import Foundation

struct Log: Identifiable {
    enum LogType: String, Identifiable, CaseIterable {
        case work, home, social, sport, unspecified
        var id: String {
            self.rawValue
        }

        var icon: String {
            switch self {
            case .work:
                return "🏦"
            case .home:
                return "🏡"
            case .social:
                return "🎉"
            case .sport:
                return "🏟"
            case .unspecified:
                return "📌"
            }
        }
    }

    var logType: LogType
    var date: Date
    var note: String
    var id: String
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }

    init(id: String = UUID().uuidString, logType: LogType = .unspecified, date: Date, note: String) {
        self.logType = logType
        self.date = date
        self.note = note
        self.id = id
    }

    // Data to be used in the preview
    static var sampleEvents: [Log] {
        return [
            Log(logType: .home, date: Date().diff(numDays: 0), note: "Take dog to groomers"),
            Log(date: Date().diff(numDays: -1), note: "Get gift for Emily"),
            Log(logType: .home, date: Date().diff(numDays: 6), note: "File tax returns."),
            Log(logType: .social, date: Date().diff(numDays: 2), note: "Dinner party at Dave and Janet's"),
            Log(logType: .work, date: Date().diff(numDays: -1), note: "Complete Audit."),
            Log(logType: .sport, date: Date().diff(numDays: -3), note: "Football Game"),
            Log(date: Date().diff(numDays: -4), note: "Plan for winter vacation.")
        ]
    }
}
