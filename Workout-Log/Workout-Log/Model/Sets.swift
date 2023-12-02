//
//  Log.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 12/2/23.
//

import SwiftUI

// Base Set struct
struct Set: Identifiable {
    var id = UUID().uuidString
    var reps: Int
    var distance: Int
    var distanceUnit: String
    var hour: Int
    var min: Int
    var sec: Int
    var notes: String
}

// Extended structs
extension Set {
    struct WarmUp {
        var set: Set
        
    }
    
    struct PreSet {
        var set: Set
        
    }
    
    struct MainSet {
        var set: Set
        
    }
    
    struct WarmDown {
        var set: Set
        
    }
}

// Example usage
let warmUpSet = Set.WarmUp(set: Set(reps: 10, distance: 100, distanceUnit: "miles", hour: 0, min: 5, sec: 30, notes: ""))
let preSet = Set.PreSet(set: Set(reps: 8, distance: 200, distanceUnit: "miles", hour: 0, min: 4, sec: 0, notes: ""))
let mainSet = Set.MainSet(set: Set(reps: 12, distance: 300, distanceUnit: "miles", hour: 0, min: 7, sec: 0, notes: ""))
let warmDown = Set.WarmDown(set: Set(reps: 5, distance: 50, distanceUnit: "miles", hour: 0, min: 2, sec: 0, notes: ""))

