//
//  Log.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 12/1/23.
//

import SwiftUI


//log model

//array of logs
struct Log: Identifiable{
    var id = UUID().uuidString
//    var title: String
    var warmUp: String
    var preSet: String
    var mainSet: String
    var warmDown: String
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
        Log(warmUp: "Sample warm-up 1", preSet: "Sample pre-set 1", mainSet: "Sample main set 1", warmDown: "Sample warm-down 1"),
        Log(warmUp: "Sample warm-up 2", preSet: "Sample pre-set 2", mainSet: "Sample main set 2", warmDown: "Sample warm-down 2"),
        Log(warmUp: "Sample warm-up 3", preSet: "Sample pre-set 3", mainSet: "Sample main set 3", warmDown: "Sample warm-down 3")
    ], logDate: getSampleLog(offset: 1)),
    
    LogMetaData(log: [
        Log(warmUp: "Sample warm-up 4", preSet: "Sample pre-set 1", mainSet: "Sample main set 1", warmDown: "Sample warm-down 1"),
    ], logDate: getSampleLog(offset: -3)),
    
    LogMetaData(log: [
        Log(warmUp: "Sample warm-up 5", preSet: "Sample pre-set 1", mainSet: "Sample main set 1", warmDown: "Sample warm-down 1"),
    ],logDate: getSampleLog(offset: -8)),
    
    LogMetaData(log: [
        Log(warmUp: "Sample warm-up 6", preSet: "Sample pre-set 1", mainSet: "Sample main set 1", warmDown: "Sample warm-down 1"),
    ],logDate: getSampleLog(offset: 10)),
    
    LogMetaData(log: [
        Log(warmUp: "Sample warm-up 7", preSet: "Sample pre-set 1", mainSet: "Sample main set 1", warmDown: "Sample warm-down 1"),
    ],logDate: getSampleLog(offset: -22)),
    
    LogMetaData(log: [
        Log(warmUp: "Sample warm-up 8", preSet: "Sample pre-set 1", mainSet: "Sample main set 1", warmDown: "Sample warm-down 1"),
    ],logDate: getSampleLog(offset: 15)),
    
    LogMetaData(log: [
        Log(warmUp: "Sample warm-up 9", preSet: "Sample pre-set 1", mainSet: "Sample main set 1", warmDown: "Sample warm-down 1"),
    ],logDate: getSampleLog(offset: -20)),
]


    
    
