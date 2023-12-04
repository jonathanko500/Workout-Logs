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
    var warmUp: Workout.WarmUp
    var preSet: Workout.PreSet
    var mainSet: Workout.MainSet
    var warmDown: Workout.WarmDown
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
        Log(warmUp: Workout.WarmUp(set: Workout(sets: "1000 SKIPS", notes: "1")),
            preSet: Workout.PreSet(set: Workout(sets: "300 K/D/S", notes: "1")),
            mainSet: Workout.MainSet(set: Workout(sets: "5 x 100 kick", notes: "1")),
            warmDown: Workout.WarmDown(set: Workout(sets: "flop", notes: "1"))
        )
    ], logDate: getSampleLog(offset: 1)),
    
    LogMetaData(log: [
        Log(warmUp: Workout.WarmUp(set: Workout(sets: "1000 SKIPS", notes: "2")),
            preSet: Workout.PreSet(set: Workout(sets: "300 K/D/S", notes: "2")),
            mainSet: Workout.MainSet(set: Workout(sets: "5 x 100 kick", notes: "2")),
            warmDown: Workout.WarmDown(set: Workout(sets: "flop", notes: "2"))
        )
    ], logDate: getSampleLog(offset: -3)),
    
    
    LogMetaData(log: [
        Log(warmUp: Workout.WarmUp(set: Workout(sets: "1000 SKIPS", notes: "3")),
            preSet: Workout.PreSet(set: Workout(sets: "300 K/D/S", notes: "3")),
            mainSet: Workout.MainSet(set: Workout(sets: "5 x 100 kick", notes: "3")),
            warmDown: Workout.WarmDown(set: Workout(sets: "flop", notes: "3"))
        )
    ], logDate: getSampleLog(offset: 3)),
    
    
    LogMetaData(log: [
        Log(warmUp: Workout.WarmUp(set: Workout(sets: "1000 SKIPS", notes: "4")),
            preSet: Workout.PreSet(set: Workout(sets: "300 K/D/S", notes: "4")),
            mainSet: Workout.MainSet(set: Workout(sets: "5 x 100 kick", notes: "4")),
            warmDown: Workout.WarmDown(set: Workout(sets: "flop", notes: "4"))
        )
    ], logDate: getSampleLog(offset: -8)),
    
    
    
    LogMetaData(log: [
        Log(warmUp: Workout.WarmUp(set: Workout(sets: "1000 SKIPS", notes: "5")),
            preSet: Workout.PreSet(set: Workout(sets: "300 K/D/S", notes: "5")),
            mainSet: Workout.MainSet(set: Workout(sets: "5 x 100 kick", notes: "5")),
            warmDown: Workout.WarmDown(set: Workout(sets: "flop", notes: "5"))
        )
    ], logDate: getSampleLog(offset: 10)),
]
