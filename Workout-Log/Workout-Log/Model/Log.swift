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


var logs: [LogMetaData] = []



func copyWorkoutsToLogs() {
    for workoutEntry in workouts {
        let warmUp = Workout.WarmUp(set: Workout(sets: workoutEntry.workout[0].sets, notes: workoutEntry.workout[0].notes))
        let preSet = Workout.PreSet(set: Workout(sets: workoutEntry.workout[1].sets, notes: workoutEntry.workout[1].notes))
        let mainSet = Workout.MainSet(set: Workout(sets: workoutEntry.workout[2].sets, notes: workoutEntry.workout[2].notes))
        let warmDown = Workout.WarmDown(set: Workout(sets: workoutEntry.workout[3].sets, notes: workoutEntry.workout[3].notes))

        let logEntry = Log(warmUp: warmUp, preSet: preSet, mainSet: mainSet, warmDown: warmDown, time: workoutEntry.workoutDate)
        
        let logMetaData = LogMetaData(log: [logEntry], logDate: workoutEntry.workoutDate)
        logs.append(logMetaData)
    }
}
