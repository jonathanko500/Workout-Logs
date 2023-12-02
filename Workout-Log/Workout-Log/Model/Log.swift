//
//  Log.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 12/1/23.
//

import SwiftUI

//array of logs
struct Log: Identifiable{
    var id = UUID().uuidString
    var warmUp: Set.WarmUp
    var preSet: Set.PreSet
    var mainSet: Set.MainSet
    var warmDown: Set.WarmDown
    var time: Date = Date()
}

//all logs view
struct LogMetaData: Identifiable{
    var id = UUID().uuidString
    var log: [Log]
    var logDate: Date
}

//sample logs
func getSampleLog(offset: Int) -> Date{
    let calender = Calendar.current
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}


var logs: [LogMetaData] = [
    LogMetaData(log: [
        Log(warmUp: Set.WarmUp(set: Set(reps: 10, distance: 100, distanceUnit: "miles", hour: 0, min: 5, sec: 30, notes: "1")),
            preSet: Set.PreSet(set: Set(reps: 8, distance: 200, distanceUnit: "miles", hour: 0, min: 4, sec: 0, notes: "1")),
            mainSet: Set.MainSet(set: Set(reps: 12, distance: 300, distanceUnit: "miles", hour: 0, min: 7, sec: 0, notes: "1")),
            warmDown: Set.WarmDown(set: Set(reps: 5, distance: 50, distanceUnit: "miles", hour: 0, min: 2, sec: 0, notes: "1"))
        )
    ], logDate: getSampleLog(offset: 1)),
    
    LogMetaData(log: [
        Log(warmUp: Set.WarmUp(set: Set(reps: 10, distance: 100, distanceUnit: "miles", hour: 0, min: 5, sec: 30, notes: "2")),
            preSet: Set.PreSet(set: Set(reps: 8, distance: 200, distanceUnit: "miles", hour: 0, min: 4, sec: 0, notes: "2")),
            mainSet: Set.MainSet(set: Set(reps: 12, distance: 300, distanceUnit: "miles", hour: 0, min: 7, sec: 0, notes: "2")),
            warmDown: Set.WarmDown(set: Set(reps: 5, distance: 50, distanceUnit: "miles", hour: 0, min: 2, sec: 0, notes: "2"))
        )
    ], logDate: getSampleLog(offset: -3)),
    
    LogMetaData(log: [
        Log(warmUp: Set.WarmUp(set: Set(reps: 10, distance: 100, distanceUnit: "miles", hour: 0, min: 5, sec: 30, notes: "3")),
            preSet: Set.PreSet(set: Set(reps: 8, distance: 200, distanceUnit: "miles", hour: 0, min: 4, sec: 0, notes: "3")),
            mainSet: Set.MainSet(set: Set(reps: 12, distance: 300, distanceUnit: "miles", hour: 0, min: 7, sec: 0, notes: "3")),
            warmDown: Set.WarmDown(set: Set(reps: 5, distance: 50, distanceUnit: "miles", hour: 0, min: 2, sec: 0, notes: "3"))
        )
    ], logDate: getSampleLog(offset: -10)),
    
    LogMetaData(log: [
        Log(warmUp: Set.WarmUp(set: Set(reps: 10, distance: 100, distanceUnit: "miles", hour: 0, min: 5, sec: 30, notes: "4")),
            preSet: Set.PreSet(set: Set(reps: 8, distance: 200, distanceUnit: "miles", hour: 0, min: 4, sec: 0, notes: "4")),
            mainSet: Set.MainSet(set: Set(reps: 12, distance: 300, distanceUnit: "miles", hour: 0, min: 7, sec: 0, notes: "4")),
            warmDown: Set.WarmDown(set: Set(reps: 5, distance: 50, distanceUnit: "miles", hour: 0, min: 2, sec: 0, notes: "4"))
        )
    ], logDate: getSampleLog(offset: 3)),
    
    
    LogMetaData(log: [
        Log(warmUp: Set.WarmUp(set: Set(reps: 10, distance: 100, distanceUnit: "miles", hour: 0, min: 5, sec: 30, notes: "5")),
            preSet: Set.PreSet(set: Set(reps: 8, distance: 200, distanceUnit: "miles", hour: 0, min: 4, sec: 0, notes: "5")),
            mainSet: Set.MainSet(set: Set(reps: 12, distance: 300, distanceUnit: "miles", hour: 0, min: 7, sec: 0, notes: "5")),
            warmDown: Set.WarmDown(set: Set(reps: 5, distance: 50, distanceUnit: "miles", hour: 0, min: 2, sec: 0, notes: "5"))
        )
    ], logDate: getSampleLog(offset: 8)),
    
    
    LogMetaData(log: [
        Log(warmUp: Set.WarmUp(set: Set(reps: 10, distance: 100, distanceUnit: "miles", hour: 0, min: 5, sec: 30, notes: "6")),
            preSet: Set.PreSet(set: Set(reps: 8, distance: 200, distanceUnit: "miles", hour: 0, min: 4, sec: 0, notes: "")),
            mainSet: Set.MainSet(set: Set(reps: 12, distance: 300, distanceUnit: "miles", hour: 0, min: 7, sec: 0, notes: "")),
            warmDown: Set.WarmDown(set: Set(reps: 5, distance: 50, distanceUnit: "miles", hour: 0, min: 2, sec: 0, notes: ""))
        )
    ], logDate: getSampleLog(offset: -15)),
    
    LogMetaData(log: [
        Log(warmUp: Set.WarmUp(set: Set(reps: 10, distance: 100, distanceUnit: "miles", hour: 0, min: 5, sec: 30, notes: "6")),
            preSet: Set.PreSet(set: Set(reps: 8, distance: 200, distanceUnit: "miles", hour: 0, min: 4, sec: 0, notes: "6")),
            mainSet: Set.MainSet(set: Set(reps: 12, distance: 300, distanceUnit: "miles", hour: 0, min: 7, sec: 0, notes: "6")),
            warmDown: Set.WarmDown(set: Set(reps: 5, distance: 50, distanceUnit: "miles", hour: 0, min: 2, sec: 0, notes: "6"))
        )
    ], logDate: getSampleLog(offset: 9)),
    
    
]

