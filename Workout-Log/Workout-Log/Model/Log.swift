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
        Log(warmUp: Set.WarmUp(set: Set(sets:"1000 SKIPS", notes: "1")),
            preSet: Set.PreSet(set: Set(sets:"300 K/D/S", notes: "1")),
            mainSet: Set.MainSet(set: Set(sets:"5 x 100 kick", notes: "1")),
            warmDown: Set.WarmDown(set: Set(sets: "flop", notes: "1"))
        )
    ], logDate: getSampleLog(offset: 1)),
    
    LogMetaData(log: [
        Log(warmUp: Set.WarmUp(set: Set(sets:"1000 SKIPS", notes: "2")),
            preSet: Set.PreSet(set: Set(sets:"300 K/D/S", notes: "2")),
            mainSet: Set.MainSet(set: Set(sets:"5 x 100 kick", notes: "2")),
            warmDown: Set.WarmDown(set: Set(sets: "flop", notes: "2"))
        )
    ], logDate: getSampleLog(offset: -3)),
    
    LogMetaData(log: [
        Log(warmUp: Set.WarmUp(set: Set(sets:"1000 SKIPS", notes: "3")),
            preSet: Set.PreSet(set: Set(sets:"300 K/D/S", notes: "3")),
            mainSet: Set.MainSet(set: Set(sets:"5 x 100 kick", notes: "3")),
            warmDown: Set.WarmDown(set: Set(sets: "flop", notes: "3"))
        )
    ], logDate: getSampleLog(offset: -10)),
    
    LogMetaData(log: [
        Log(warmUp: Set.WarmUp(set: Set(sets:"1000 SKIPS", notes: "4")),
            preSet: Set.PreSet(set: Set(sets:"300 K/D/S", notes: "4")),
            mainSet: Set.MainSet(set: Set(sets:"5 x 100 kick", notes: "4")),
            warmDown: Set.WarmDown(set: Set(sets: "flop", notes: "4"))
        )
    ], logDate: getSampleLog(offset: 3)),
    
    
    LogMetaData(log: [
        Log(warmUp: Set.WarmUp(set: Set(sets:"1000 SKIPS", notes: "5")),
            preSet: Set.PreSet(set: Set(sets:"300 K/D/S", notes: "5")),
            mainSet: Set.MainSet(set: Set(sets:"5 x 100 kick", notes: "5")),
            warmDown: Set.WarmDown(set: Set(sets: "flop", notes: "5"))
        )
    ], logDate: getSampleLog(offset: 8)),
    
    
    LogMetaData(log: [
        Log(warmUp: Set.WarmUp(set: Set(sets:"1000 SKIPS", notes: "6")),
            preSet: Set.PreSet(set: Set(sets:"300 K/D/S", notes: "6")),
            mainSet: Set.MainSet(set: Set(sets:"5 x 100 kick", notes: "6")),
            warmDown: Set.WarmDown(set: Set(sets: "flop", notes: "6"))
        )
    ], logDate: getSampleLog(offset: -15)),
    
    LogMetaData(log: [
        Log(warmUp: Set.WarmUp(set: Set(sets:"1000 SKIPS", notes: "7")),
            preSet: Set.PreSet(set: Set(sets:"300 K/D/S", notes: "7")),
            mainSet: Set.MainSet(set: Set(sets:"5 x 100 kick", notes: "7")),
            warmDown: Set.WarmDown(set: Set(sets: "flop", notes: "7"))
        )
    ], logDate: getSampleLog(offset: 9)),
    
    
]

