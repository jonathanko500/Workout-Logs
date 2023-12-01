//
//  DateValue.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 12/1/23.
//

import SwiftUI

//Date Value Model
struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
