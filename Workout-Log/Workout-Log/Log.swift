//
//  Log.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 11/28/23.
//

import Foundation

struct WorkoutLog: Identifiable {
    enum ExerciseType: String, Identifiable, CaseIterable {
        case set
        var id: String {
            self.rawValue
        }
    }
    
    var exerciseType: ExerciseType
    var date: Date
    var warmUp: String
    var preSet: String
    var mainSet: String
    var coolDown: String
    var id: String
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
    
    init(id: String = UUID().uuidString, exerciseType: ExerciseType, date: Date, warmUp: String, preSet: String, mainSet: String, coolDown: String) {
        self.exerciseType = exerciseType
        self.date = date
        self.warmUp = warmUp
        self.preSet = preSet
        self.mainSet = mainSet
        self.coolDown = coolDown
        self.id = id
    }
    
    // Sample workout log entries
    static var sampleWorkouts: [WorkoutLog] {
        return [
            WorkoutLog(exerciseType: .set, date: Date().addingTimeInterval(-3600), warmUp: "Stretching and mobility drills", preSet: "Light jogging", mainSet: "Weightlifting - 3 sets of 12 reps", coolDown: "Slow jogging and stretching"),
            WorkoutLog(exerciseType: .set, date: Date().addingTimeInterval(-7200), warmUp: "Dynamic stretching", preSet: "Jumping jacks and bodyweight exercises", mainSet: "High-intensity interval training - 20 sets", coolDown: "Breathing exercises and cool-down stretches"),
            WorkoutLog(exerciseType: .set, date: Date().addingTimeInterval(-10800), warmUp: "Warm-up jog", preSet: "Sprints", mainSet: "Running - 8 sets of 2km each", coolDown: "Walking and light stretching"),
            WorkoutLog(exerciseType: .set, date: Date().addingTimeInterval(-14400), warmUp: "Joint rotations", preSet: "Calisthenics - 3 sets of 15 reps", mainSet: "Core exercises", coolDown: "Static stretching and relaxation techniques")
        ]
    }
}
