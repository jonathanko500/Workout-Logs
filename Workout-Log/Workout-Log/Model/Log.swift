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
    var title: String
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
        Log(title: "Sample 1"),
        Log(title: "Sample 2"),
        Log(title: "Sample 3")
    ], logDate: getSampleLog(offset: 1)),
    
    LogMetaData(log: [
        Log(title: "Sample 4")
    ], logDate: getSampleLog(offset: -3)),
    
    LogMetaData(log: [
        Log(title: "Sample 5")
    ],logDate: getSampleLog(offset: -8)),
    
    LogMetaData(log: [
        Log(title: "Sample 6")
    ],logDate: getSampleLog(offset: 10)),
    
    LogMetaData(log: [
        Log(title: "Sample 7")
    ],logDate: getSampleLog(offset: -22)),
    
    LogMetaData(log: [
        Log(title: "Sample 8")
    ],logDate: getSampleLog(offset: 15)),
    
    LogMetaData(log: [
        Log(title: "Sample 9")
    ],logDate: getSampleLog(offset: -20)),
]
