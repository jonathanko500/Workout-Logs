//
//  Date+Extension.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 11/28/23.
//

import Foundation

extension Date {
    func diff(numDays: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: numDays, to: self)!
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}
