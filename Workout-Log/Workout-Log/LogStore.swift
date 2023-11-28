//
//  LogStore.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 11/28/23.
//

import Foundation

@MainActor
class WorkoutLogStore: ObservableObject {
    @Published var workoutLogs = [WorkoutLog]()
    @Published var preview: Bool
    @Published var changedWorkoutLog: WorkoutLog?
    @Published var movedWorkoutLog: WorkoutLog?

    init(preview: Bool = false) {
        self.preview = preview
        fetchWorkoutLogs()
    }

    func fetchWorkoutLogs() {
        if preview {
            workoutLogs = WorkoutLog.sampleWorkouts
        } else {
            // Load from your persistence store
        }
    }

    func delete(_ workoutLog: WorkoutLog) {
        if let index = workoutLogs.firstIndex(where: { $0.id == workoutLog.id }) {
            changedWorkoutLog = workoutLogs.remove(at: index)
        }
    }

    func add(_ workoutLog: WorkoutLog) {
        workoutLogs.append(workoutLog)
        changedWorkoutLog = workoutLog
    }

    func update(_ workoutLog: WorkoutLog) {
        if let index = workoutLogs.firstIndex(where: { $0.id == workoutLog.id }) {
            movedWorkoutLog = workoutLogs[index]
            workoutLogs[index].date = workoutLog.date
            workoutLogs[index].warmUp = workoutLog.warmUp
            workoutLogs[index].preSet = workoutLog.preSet
            workoutLogs[index].mainSet = workoutLog.mainSet
            workoutLogs[index].coolDown = workoutLog.coolDown
            changedWorkoutLog = workoutLog
        }
    }
}
