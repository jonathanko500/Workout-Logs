//
//  Workout.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 12/4/23.
//


import Foundation
import CoreData

// Base Workout struct
struct Workout: Identifiable {
    var id = UUID()
    var sets: String
    var notes: String
}

// Extended structs
extension Workout {
    struct WarmUp {
        var set: Workout
    }
    
    struct PreSet {
        var set: Workout
    }
    
    struct MainSet {
        var set: Workout
    }
    
    struct WarmDown {
        var set: Workout
    }
}

struct WorkoutMetaData: Identifiable {
    var id = UUID().uuidString
    var workout: [Workout]
    var workoutDate: Date
}


var workouts: [WorkoutMetaData] = []


func saveToWorkouts(warmUp: Workout.WarmUp, preSet: Workout.PreSet, mainSet: Workout.MainSet, warmDown: Workout.WarmDown, date: Date) {
    // Create Workout objects from the provided input

    let warmUpWorkout = Workout(sets: warmUp.set.sets, notes: warmUp.set.notes)
    let preSetWorkout = Workout(sets: preSet.set.sets, notes: preSet.set.notes)
    let mainSetWorkout = Workout(sets: mainSet.set.sets, notes: mainSet.set.notes)
    let warmDownWorkout = Workout(sets: warmDown.set.sets, notes: warmDown.set.notes)

    // Create WorkoutMetaData object
    let workoutMetaData = WorkoutMetaData(workout: [warmUpWorkout, preSetWorkout, mainSetWorkout, warmDownWorkout], workoutDate: date)

    // Append WorkoutMetaData to workouts array
    workouts.append(workoutMetaData)
}

