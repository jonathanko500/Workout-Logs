//
//  LogFormVM.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 11/29/23.
//


import Foundation

class LogFormVM: ObservableObject {
    @Published var date = Date()
        @Published var note = ""
    @Published var eventType: Log.LogType = .unspecified

        var id: String?
        var updating: Bool { id != nil }

        init() {}

        init(_ log: Log) {
            date = log.date
            note = log.note
            eventType = log.logType
            id = log.id
        }

        var incomplete: Bool {
            note.isEmpty
        }
    }
